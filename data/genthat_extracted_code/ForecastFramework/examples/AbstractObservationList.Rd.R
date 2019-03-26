library(ForecastFramework)


### Name: AbstractObservationList
### Title: AbstractObservationList
### Aliases: AbstractObservationList

### ** Examples

require(dplyr)
ObservationList<- R6Class(
  classname= "ObservationList",
  inherit = AbstractObservationList,
  private = list(
    .aggregate = NULL,
    .frame = data_frame(),
    aCurrent = FALSE,
    .aDims = list(),
    .aVal = '',
    .slice = 1,
    .aDimData = list(),
    na.rm = FALSE,
    updateArray = function(na.rm = private$na.rm){
      if('updateArray' %in% private$.debug){
        browser()
      }

      if(length(self$aDims) == 0){
        warning("Form array with formArray first")
        private$.arr = array(as.numeric(NA),c(0,0))
        private$.ndim = 2
        private$.dims = c(0,0)
        private$.dimData = list(list(),list())
        private$.dnames = list()
        return()
      }
      if(nrow(private$.frame) == 0){
        warning("The frame is empty.")
        private$.arr = array(as.numeric(NA),c(1:self$aDims*0))
        private$.ndim = length(self$aDims)
        private$.dims = 1:length(self$aDims)*0
        private$.dimData = lapply(self$aDims,list())
        private$.dnames = list()
        return()
      }
      private$.dnames = lapply(self$aDims,function(name){
        as.character(unique(private$.frame[[name]]))
      })
      private$.dims = sapply(private$.dnames,length)
      private$.ndim = length(private$.dims)
      private$.arr <- private$.frame %>%
        select_(
          .dots = setNames(
            c(unlist(self$aDims),self$aVal),
            nm=c(unlist(self$aDims),self$aVal)
          )
        ) %>%
        group_by_(.dots=setNames(self$aDims,NULL)) %>%
        self$aggregate() %>%
        ungroup() %>%
        acast(as.formula(paste(self$aDims,collapse='~')),value.var=self$aVal)
      mode(private$.arr) = 'numeric'
      private$.dnames = dimnames(private$.arr)
      if(class(self$aDimData) == 'list'){
        if(length(self$aDimData) < length(self$aDims)){
          self$aDimData[length(self$aDims)] = list(NULL)
        }
      } else {
        stop("array metadata should be a list of columns in the data frame.")
      }
      private$.dimData = mapply(dim=self$aDims,data=self$aDimData,function(dim,data){
        self$frame %>%
          group_by_(dim) %>%
          self$aggregate() %>%
          ungroup() %>%
          select_(.dots=data) %>%
          as.list()
      })
      if(length(private$.dimData) < private$.ndim){
        private$.dimData = lapply(1:private$.ndim,function(x){
          if(length(private$.dimData >= x)){
            private$.dimData[[x]]
          } else {
            list()
          }
        })
      }
      private$aCurrent <- TRUE
    }
  ),
  public = list(
    initialize = function(data=data_frame(),...){
      self$frame <- as_data_frame(data)
      self$formArray(...)
      private$.aggregate = function(input_data){
        if('aggregate' %in% private$.debug){
          browser()
        }
        grouping = groups(input_data)
        input_data %>%
          input_data <- summarize_all(funs(
            sum = if(is.numeric(.) || is.logical(.)){
              sum(.,na.rm=private$na.rm)
            } else{NA},
            unique = if(length(unique(.))==1){unique(.)} else{list(unique(.))}))
        input_data <- input_data %>%
          group_by_(.dots=grouping)
        if('sum' %in% names(input_data)){
          input_data <- input_data %>%
            rename_(.dots=setNames('sum',paste(private$.aVal,'_sum',sep='')))
        }
        if('unique' %in% names(input_data)){
          input_data <- input_data %>%
            rename_(
              .dots=setNames('unique',paste(private$.aVal,'_unique',sep=''))
            )
        }
        column_names = c(
          unlist(
            sapply(private$.aDimData,function(x){paste(x,"_unique",sep='')})
          ),
          paste(private$.aVal,'_sum',sep=''))
        column_names = column_names[column_names %in% names(input_data)]
        input_data %>%
          select_(.dots=column_names) ->
          input_data
        input_data %>%
          rename_(.dots=setNames(
            names(input_data)[grepl(names(input_data),pattern='_unique')],
            lapply(
              names(input_data)[grepl(names(input_data),pattern='_unique')],
              function(x){substr(x,1,nchar(x)-7)}
            )
          )) %>%
          rename_(.dots=setNames(
            names(input_data)[grepl(names(input_data),pattern='_sum')],
            lapply(
              names(input_data)[grepl(names(input_data),pattern='_sum')],
              function(x){substr(x,1,nchar(x)-4)}
            )
          )) %>%
          return()
      }
    },
    formArray = function(...,val,dimData=list(),metaData=list()){
      if('formArray' %in% private$.debug){
        browser()
      }
      if(missing(val)){
        if(length(list(...))==0){
          return()
        } else{
          stop("val must be supplied in order to form the incidenceArray")
        }
      }
      private$aCurrent=FALSE
      private$.dnames = NULL
      self$aDims = list(...)
      self$aVal = val
      self$aDimData = dimData
      metaDataKeys <-
        names(private$.metaData)[!(names(private$.metaData) %in% names(metaData))]
      self$metaData = c(private$.metaData[metaDataKeys],metaData)
    }
  ),
  active = list(
    frame = function(value){
      if('frame' %in% private$.debug){
        browser()
      }
      private$aCurrent = FALSE
      if(!missing(value)){
        private$.rnames = NULL
        private$.cnames = NULL
      }
      private$defaultActive('.frame','private',value)
    },
    arr = function(value){
      if('arr' %in% private$.debug){
       browser()
      }
      if(missing(value)){
        if(private$aCurrent == FALSE){
          private$updateArray()
        }
        return(private$.arr)
      }
      stop("Do not write directly to the array.")
    },
    dims = function(value){
      if('dims' %in% private$.debug){
       browser()
      }
      if(missing(value)){
        if(private$aCurrent == FALSE){
          private$updateArray()
        }
        return(private$.dims)
      }
      stop("Do not write directly to the dimensions.")
    },
    ndim = function(value){
      if('ndim' %in% private$.debug){
       browser()
      }
      if(missing(value)){
        if(private$aCurrent == FALSE){
          private$updateArray()
        }
        return(private$.ndim)
      }
      stop("Do not write directly to the number of dimensions.")
    },
    dimData = function(value){
      if('dimData' %in% private$.debug){
       browser()
      }
      if(private$aCurrent == FALSE){
        private$updateArray()
      }
      if(missing(value)){
        return(private$.dimData)
      }
      if(is.null(value)){
        private$.dimData=NULL
      } else if(class(value) == 'list'){
        nval = length(value)
        if(nval == 0){
          private$.dimData = value
        } else if(nval <= private$.ndim){
          if(all(mapply(function(self,other){
            is.null(other) ||
            all(sapply(other,function(x){self==length(x)}))
          },
          self = private$.dims[1:nval],
          other=value
          ))){
            private$.dimData[!sapply(value,is.null)] = value[!sapply(value,is.null)]
          } else {
            stop("The dimensions don't match up.")
          }
        } else {
          stop("Invalid number of dimensions.")
        }
      } else {
        stop(paste(
          "Not sure how to make dimension metaData from object of class",
          class(value)
        ))
      }
    },
    dnames = function(value){
      if('dnames' %in% private$.debug){
       browser()
      }
      if(missing(value)){
        if(private$aCurrent == FALSE){
          private$updateArray()
        }
        return(private$.dnames)
      }
      stop("Do not write directly to the dimension names.")
    },
    nrow = function(value){
      if('nrow' %in% private$.debug){
       browser()
      }
      if(missing(value)){
        if(private$aCurrent == FALSE){
          private$updateArray()
        }
        return(private$.dims[1])
      }
      stop("Do not write directly to the number of rows.")
    },
    ncol = function(value){
      if('ncol' %in% private$.debug){
       browser()
      }
      if(missing(value)){
        if(private$aCurrent == FALSE){
          private$updateArray()
        }
        return(private$.dims[2])
      }
      stop("Do not write directly to the number of columns.")
    },
    rnames = function(value){
      if('rnames' %in% private$.debug){
       browser()
      }
      if(missing(value)){
        if(private$aCurrent == FALSE){
          private$updateArray()
        }
        return(private$.dnames[[1]])
      }
      stop("Do not write directly to the row names.")
    },
    cnames = function(value){
      if('cnames' %in% private$.debug){
       browser()
      }
      if(missing(value)){
        if(private$aCurrent == FALSE){
          private$updateArray()
        }
        return(private$.dnames[[2]])
      }
      stop("Do not write directly to the column names.")
    },
    colData = function(value){
      if('colData' %in% private$.debug){
       browser()
      }
      if(missing(value)){
        if(private$aCurrent == FALSE){
          private$updateArray()
        }
        return(self$dimData[[2]])
      }
      self$dimData[[2]] <- value
    },
    rowData = function(value){
      if('rowData' %in% private$.debug){
       browser()
      }
      if(missing(value)){
        if(private$aCurrent == FALSE){
          private$updateArray()
        }
        return(self$dimData[[1]])
      }
      self$dimData[[1]] <- value
    },
    aDims = function(value){
      if('aDims' %in% private$.debug){
        browser()
      }
      if(missing(value)){
        return(private$.aDims)
      }
      lapply(value,function(value){
        if(!all(value %in% colnames(private$.frame))){
          stop(paste(value,"is not a column of the frame"))
        }
      })
      private$.aDims = value
      private$aCurrent = FALSE
    },
    aVal = function(value){
      if('aVal' %in% private$.debug){
        browser()
      }
      if(missing(value)){
        return(private$.aVal)
      }
      if(!(value %in% colnames(private$.frame))){
        stop(paste(value,"is not a column of the frame"))
      }
      private$.aVal = value
      private$aCurrent = FALSE
    },
    aDimData = function(value){
      if('aDimData' %in% private$.debug){
        browser()
      }
      if(missing(value)){
        return(private$.aDimData)
      }
      lapply(value,function(value){
        for(val in value){
          if(!(val %in% colnames(private$.frame))){
            stop(paste(val,"is not a column of the frame"))
          }
        }
      })
      private$.aDimData = value
      private$aCurrent = FALSE
    },
    mat = function(value){
      if('mat' %in% private$.debug){
        browser()
      }
      if(missing(value)){
        if(private$aCurrent == FALSE){
          private$updateArray()
        }
        if(private$.ndim == 2){
          return(as.matrix(private$.arr))
        }
        return(apply(private$.arr,c(1,2),function(x){x[slice]}))
      }
      stop(paste(
        "Do not write directly to the mat, because it is automatically",
        "calculated.  The Observation List is called frame"
      ))
    },
    slice = function(value){
      if(missing(value)){
        return(private$.slice)
      }
      if(any(c(1,1,value) > self$dims)){
        stop("Value must be between 1 and length in that dimension.")
      }
      private$.slice = matrix(value,1)
    },
    aggregate = function(value){
      if(missing(value)){
        return(private$.aggregate)
      }
      private$aCurrent = FALSE
      if(class(value) != 'function'){
        stop(paste(
          "Not a function.  aggregate should be a function taking a single",
          "data_frame argument called input_data"
        ))
      }
      if(length(names(formals(fun=value))) != 1){
        stop(paste(
          "Not a valid function for aggregation.  A valid aggregation function",
          "must take a single data_frame argument."
        ))
      }
      private$.aggregate = value
    }
  )
)



