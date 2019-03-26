library(ForecastFramework)


### Name: AbstractSimulatedIncidenceMatrix
### Title: AbstractSimulatedIncidenceMatrix
### Aliases: AbstractSimulatedIncidenceMatrix

### ** Examples

SimulatedIncidenceMatrix <- R6Class(
  classname = "SimulatedIncidenceMatrix",
  inherit = AbstractSimulatedIncidenceMatrix,
  private = list(
    .ndim = 3,
    ncore = 1,
    .sample = 1,
    parallelEnvironment = NULL
  ),
  public = list(
    initialize = function(data=MatrixData$new(),nsim=1){
      if('AbstractSimulatedIncidenceMatrix' %in% class(data)){
        private$.arr= data$simulations
        private$.metaData = data$metaData
        private$.dimData = data$dimData
        private$.dnames = data$dnames
        private$.dims = data$dims
        private$.ndim = length(self$dims)
        return()
      }
      else if('list' %in% class(data)){
        if('MatrixData' %in% class(data[[1]])){
          if((!missing(nsim)) && (nsim != length(data))){
            stop("nsim is not used for list data.")
          }
          private$.dims = c(data[[1]]$nrow,data[[1]]$ncol,length(data))
          private$.arr = array(NA,c(self$nrow,self$ncol,self$nsim))
          if(self$nsim > 0){
            for(i in 1: self$nsim){
              private$.arr[,,i] = data[[i]]$mat
            }
          }
          data = data[[1]]
          private$.metaData = data$metaData
          private$.dimData = list(data$rowData,data$colData)
          if(!is.null(data$rnames)){
            if(!is.null(data$cnames)){
              private$.dnames = list(data$rnames,data$cnames,NULL)
            } else{
              private$.dnames = list(data$rnames,NULL,NULL)
            }
          } else if(!is.null(data$cnames)){
            private$.dnames = list(NULL,data$cnames,NULL)
          } else {
            private$.dnames = NULL
          }
          dimnames(private$.arr) = private$.dnames
          private$.dims = c(data$nrow,data$ncol,nsim)
          private$.ndim = 3
          return()
        }
        else{
          stop("Not yet implemented")
        }
      } else if('MatrixData' %in% class(data)){
        private$.arr= array(data$mat,c(data$nrow,data$ncol,nsim))
        private$.metaData = data$metaData
        private$.dimData = list(data$rowData,data$colData)
        if(!is.null(data$rnames)){
          if(!is.null(data$cnames)){
            private$.dnames = list(data$rnames,data$cnames,NULL)
          } else{
            private$.dnames = list(data$rnames,NULL,NULL)
          }
        } else if(!is.null(data$cnames)){
          private$.dnames = list(NULL,data$cnames,NULL)
        } else {
          private$.dnames = NULL
        }
        dimnames(private$.arr) = private$.dnames
        private$.dims = c(data$nrow,data$ncol,nsim)
        private$.ndim = 3
        return()
      }
      else{
        stop("Input data is not a valid type to make a SimulatedIncidenceMatrix")
      }
      stop("This is currently broken.")
      rownames(private$.arr) <- rownames(data[[1]]$mat)
      colnames(private$.arr) <- colnames(data[[1]]$mat)
      private$.dimData = list(data$rowData,data$colData,NULL)
      private$.metaData = data$metaData
      if(!is.null(data$rnames)){
        if(!is.null(data$cnames)){
          private$.dnames = list(data$rnames,data$cnames,NULL)
        } else{
          private$.dnames = list(data$rnames,NULL,NULL)
        }
      } else if(!is.null(data$cnames)){
        private$.dnames = list(NULL,data$cnames,NULL)
      } else {
        private$.dnames = NULL
      }
      private$.dims = c(data$nrow,data$ncol,nsim)
    },
    mean = function(){
      "Compute the mean across simulations"
      if('mean' %in% private$.debug){
        browser()
      }
      return(IncidenceMatrix$new(apply(self$simulations,c(1,2),mean)))
    },
    median = function(){
      if('median' %in% private$.debug){
        browser()
      }
      return(IncidenceMatrix$new(apply(self$arr,c(1,2),median)))
    },
    addError = function(type,rows,cols,mutate = TRUE){
      if('addError' %in% private$.debug){
        browser()
      }
      if(missing(rows)){
        rows = 1:self$nrow
      }
      if(missing(cols)){
        cols = 1:self$ncol
      }
      if(type=='Poisson'){
        private$.arr[rows,cols,] =
          rpois(length(rows)*length(cols)*self$nsim,self$arr[rows,cols,])
      } else{
        stop("Not yet implemented")
      }
    },
    subsample = function(simulations,mutate=TRUE){
      if('subsample' %in% private$.debug){
        browser()
      }
      if(!mutate){
        rc = self$clone(TRUE)
        rc$subsample(simulations,mutate=TRUE)
        return(rc)
      }
      if(
      (min(simulations) < 0) ||
        (max(simulations) > self$nsim) ||
        any(round(simulations) != simulations)
      ){
        stop("simulations out of bounds.")
      }
      private$.dims[3] = length(simulations)
      private$.arr = self$arr[,,simulations]
    },
    subset = function(rows,cols,mutate=TRUE){
      if('subset' %in% private$.debug){
        browser()
      }
      if(!mutate){
        rc = self$clone(TRUE)
        rc$subset(rows,cols,mutate=TRUE)
        return(rc)
      }

      if(missing(rows) && missing(cols)){
        return()
      }
      else if(missing(rows)){
        rows = 1:self$nrow
      }
      else if(missing(cols)){
        cols = 1:self$ncol
      }
      private$.arr = self$arr[rows,cols,,drop=FALSE]
      private$.dims = c(nrow(self$arr),ncol(self$arr),self$nsim)
      private$.dnames = dimnames(self$arr)
      if(length(self$rowData)>0){
        if(length(self$colData) > 0){
          self$dimData = list(
            lapply(self$rowData,function(x){x[rows,drop=FALSE]}),
            lapply(self$colData,function(x){x[cols,drop=FALSE]})
          )
        } else {
          self$rowData <- lapply(self$rowData,function(x){x[rows,drop=FALSE]})
        }
      } else if(length(self$colData)>0){
        self$colData <- lapply(self$colData,function(x){x[cols,drop=FALSE]})
      }
    },
    head = function(k,direction=2,mutate=FALSE){

      if('head' %in% private$.debug){
        browser()
      }
      if(k>dim(self$arr)[[direction]]){
        stop("The size of the head is too large.")
      }
      indices = 1:k

      if(direction==1){
        private$.arr = self$arr[indices,,,drop=FALSE]
        if(length(self$rowData)>0){
          private$.dimData[[1]] =
            lapply(self$rowData,function(x){x[indices,drop=FALSE]})
        }
      }
      else if(direction==2){
        private$.arr = self$arr[,indices,,drop=FALSE]
        if(length(self$colData)>0){
          private$.dimData[[2]] =
            lapply(self$colData,function(x){x[indices,drop=FALSE]})
        }
      }
      else{
        stop("This direction is not allowed.")
      }
      private$.dims = dim(self$arr)
      private$.dnames = dimnames(self$arr)
    },
    tail = function(k,direction=2){

      if('tail' %in% private$.debug){
        browser()
      }
      if(k>dim(self$arr)[[direction]]){
        stop("The size of the tail is too large.")
      }
      indices = (dim(self$arr)[[direction]]-k+1):dim(self$arr)[[direction]]

      if(direction==1){
        private$.arr = self$arr[indices,,,drop=FALSE]
        private$.dims = dim(self$arr)
        if(length(self$rowData)>0){
          self$rowData = lapply(self$rowData,function(x){x[indices,drop=FALSE]})
        }
      }
      else if(direction==2){
        private$.arr = self$arr[,indices,,drop=FALSE]
        private$.dims = dim(self$arr)
        if(length(self$colData)>0){
          self$colData = lapply(self$colData,function(x){x[indices,drop=FALSE]})
        }
      }
      else{
        stop("This direction is not allowed.")
      }
      private$.dims = dim(self$arr)
      private$.ndim = length(self$dims)
      private$.dnames = dimnames(self$arr)
    },
    lag = function(indices,mutate = TRUE,na.rm=FALSE){
      if('lag' %in% private$.debug){
        browser()
      }
      if(mutate==FALSE){
        tmp = self$clone(TRUE)
        tmp$lag(indices=indices,mutate=TRUE)
        return(tmp)
      }
      if((1+max(indices)) > self$ncol){
        stop("We cannot go further back than the start of the matrix")
      }
      numLags = length(indices)
      if(is.null(rownames(self$arr))){
        rownames(private$.arr) = 1:(dim(self$arr)[[1]])
      }
      rownames = replicate(numLags,rownames(self$arr))
      colnames = colnames(self$arr)
      private$.arr <- array(self$arr,c(dim(self$arr),numLags))
      if(numLags <= 0){
        stop("indices must be nonempty for the calculation of lags to make sense.")
      }
      for(lag in 1:numLags){
        private$.arr[,(1+indices[[lag]]):self$ncol,,lag] <-
          self$arr[,1:(self$ncol-indices[[lag]]),,lag]
        if(indices[[lag]] > 0){
          private$.arr[,1:(indices[[lag]]),,lag] = NA
        }
      }

      private$.arr = aperm(self$arr,c(1,4,2,3))
      private$.arr = array(self$arr,c(self$nrow*numLags,self$ncol,self$nsim))

      lagnames = t(replicate(self$nrow,paste('L',indices,sep='')))

      rownames(private$.arr) <-
        as.character(
          array(paste(lagnames,"R",rownames,sep=''),numLags*self$nrow)
        )
      colnames(private$.arr) <- colnames

      private$.dims[[1]] = self$nrow * numLags
      if(!is.null(dimnames(self$arr))){
        private$.dnames = dimnames(self$arr)
      }
      if(length(self$rowData) > 0){
        self$rowData <- lapply(
          self$rowData,
          function(x){
            c(unlist(recursive=FALSE,lapply(1:numLags,function(y){x})))
          }
        )
      }
      if(na.rm==TRUE){
        self$subset(cols=!apply(self$arr,2,function(x){any(is.na(x))}))
      }
    },
    addRows = function(rows){
      if('addRows' %in% private$.debug){
        browser()
      }
      if(rows == 0){
        return()
      }
      abind(self$arr,array(NA,c(rows,self$ncol,self$nsim)),along=1) ->
        private$.arr
      private$.dims[[1]] = nrow(self$arr)
      private$.dnames = dimnames(self$arr)
      if(length(self$rowData) > 0){
        self$rowData = lapply(self$rowData,function(x){c(x,replicate(rows,NA))})
      }
    },
    addColumns = function(columns){
      "This function adds columns to the data."
      "@param columns The number of columns to add."
      if('addColumns' %in% private$.debug){
        browser()
      }

      if(columns == 0){
        return()
      }
      abind(private$.arr,array(NA,c(self$nrow,columns,self$nsim)),along=2) ->
        private$.arr
      private$.dims[2]= ncol(self$arr)
      private$.dnames = dimnames(private$.arr)
      if(length(self$colData) > 0){
        self$colData = lapply(self$colData,function(x){c(x,replicate(columns,NA))})
      }
    },
    scale = function(f,mutate=TRUE){
      if('scale' %in% private$.debug){
        browser()
      }
      if(!mutate){
        tmp = self$clone(TRUE)
        tmp$scale(f=f,mutate=TRUE)
        return(tmp)
      }
      private$.arr[] = f(private$.arr[])
    },
    diff = function(lag = 1,mutate=TRUE){
      if('diff' %in% private$.debug){
        browser()
      }
      if(!mutate){
        tmp = self$clone(TRUE)
        tmp$diff(lag=lag,mutate=TRUE)
        return(tmp)
      }
      if(lag == 0){
        if(!is.null(rownames(private$.arr))){
          rownames(private$.arr) = paste("D",lag,"R",rownames(private$.arr),sep='')
        }
        private$.dnames = dimnames(private$.arr)
        return()
      }
      if(lag < 0){
        stop("lag must be non-negative.")
      }
      rn = rownames(private$.arr)
      private$.arr <-
        self$simulations- self$lag(indices=lag,mutate=FALSE)$simulations
      if(!is.null(rn)){
        rownames(private$.arr) = paste("D",lag,"R",rownames(private$.arr),sep='')
      }
      private$.dnames = dimnames(private$.arr)
    },
    mutate = function(rows,cols,data){
      if('mutate' %in% private$.debug){
        browser()
      }
      tmpdata = data
      tmpdata = array(data,self$dims)
      data = as.array(data)

      if(missing(rows)){
        rows = 1:self$nrow
        if(!(is.null(self$cnames) || is.null(colnames(data)))){
          private$.dnames[[2]][cols] = colnames(data)
          colnames(private$.arr) = self$cnames
        }
      }
      if(missing(cols)){
        cols = 1:self$ncol
        if(!(is.null(self$rnames) || is.null(rownames(data)))){
          private$.dnames[[1]][rows] = rownames(data)
          rownames(private$.arr) = self$rnames
        }
      }
      if(is.null(dim(data))){
        stop("Not yet implemented for non-matrixlike objects")
      }
      if(length(dim(data)) > 3){
        stop("There are too many dimensions in data.")
      }
      if(length(dim(data)) == 3){
        if(dim(data)[[3]] == self$nsim){
          private$.arr[rows,cols,] = data
        } else if(dim(data)[[3]] == 1){
          private$.arr[rows,cols,] = replicate(self$nsim,data)
        }
      }
      else{
        private$.arr[rows,cols,] = replicate(self$nsim,data)
      }
    },
    summarize = function(FUNC,...){
      if('apply' %in% private$.debug){
        browser()
      }
      return(IncidenceMatrix$new(
        data=apply(private$.arr,c(1,2),FUNC),
        rowData=self$rowData,
        colData=self$colData,
        metaData=self$metaData)
      )
    }
  ),
  active = list(
    sample = function(value){
      "Randomly extract a simulation"
      if("sample" %in% private$.debug){
        browser()
      }
      return = FALSE
      if(missing(value)){
        if(self$nsim < 1){
          return(private$.arr)
        }
        value = sample(self$nsim,1)
        return = TRUE
      }
      if(floor(value) != value){
        stop("sample must be an integer.")
      }

      private$.sample = value

      if(return){
        return(IncidenceMatrix$new(self))
      }
    },
    mat = function(value){
      private$.mat = adrop(private$.arr[,,private$.sample,drop=FALSE],3)
      rownames(private$.mat) = rownames(private$.arr)
      colnames(private$.mat) = colnames(private$.arr)
      return(private$.mat)
    },
    simulations = function(value){
      if(missing(value)){
        return(private$.arr)
      }
      stop("Do not write directly to the simulations")
    }
  )
)



