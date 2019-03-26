library(ForecastFramework)


### Name: AbstractIncidenceMatrix
### Title: AbstractIncidenceMatrix
### Aliases: AbstractIncidenceMatrix

### ** Examples

IncidenceMatrix <- R6Class(
  classname = "IncidenceMatrix",
  inherit = AbstractIncidenceMatrix,
  public = list(
    initialize = function(
      data=matrix(),
      metaData=list(),
      rowData=list(),
      colData=list()
    ){
      if(Reduce(
        '&&',
        c('MatrixData','DataContainer','Generic','R6') %in% class(data))
      ){
        private$.mat <- data$mat
        private$.metaData <- data$metaData
        private$.nrow <- data$nrow
        private$.ncol <- data$ncol
        private$.rnames <- data$rnames
        private$.cnames <- data$cnames
        private$.rowData <- data$rowData
        private$.colData <- data$colData
        private$.metaData <- data$metaData
        private$.cellData <- data$cellData
      }
      else{
        rtoggle = FALSE
        ctoggle = FALSE
        try({
          rnames <- dimnames(data)[[1]]
          rtoggle = TRUE
        })
        try({
          cnames <- dimnames(data)[[2]]
          ctoggle = TRUE
        })
        if(!private$checkType(name='.mat',val=data,type='private')){
          data <- as.matrix(data)
          if(rtoggle){
            rownames(data) = rnames
          }
          if(ctoggle){
            colnames(data) = cnames
          }
        }
        if(!private$checkType(name='.mat',val=data,type='private')){
          stop(paste(
            "invalid data of type",
            paste(class(data),collapse=','),
            "expected",
            paste(class(private$.mat),collapse = ',')
          ))
        }
        if(length(dim(data)) > 2){
          stop("The matrix is not intended to hold things with more than 3 dimensions.")
        }
        ndim = dim(data)
        private$.nrow = ndim[[1]]
        private$.ncol = ndim[[2]]
        private$.rnames = rownames(data)
        private$.cnames = colnames(data)
        private$.mat <- 0+data
        self$rowData <- rowData
        self$colData <- colData
        self$metaData <- metaData
      }
    },
    subset = function(rows,cols,mutate=TRUE){
      if('subset' %in% private$.debug){
        browser()
      }
      if(!mutate){
        temp = self$clone(TRUE)
        temp$subset(rows,cols,mutate=TRUE)
        return(temp)
      }
      if(missing(rows) && missing(cols)){
      }
      else if(missing(rows)){
        private$.mat = self$mat[,cols,drop=FALSE]
        if(length(private$.colData) > 0){
          private$.colData <- lapply(
            private$.colData,function(x){x[cols,drop=FALSE]}
          )
        }
      }
      else if(missing(cols)){
        private$.mat = self$mat[rows,,drop=FALSE]
        if(length(private$.rowData) > 0){
          private$.rowData <- lapply(
            private$.rowData,function(x){x[rows,drop=FALSE]}
          )
        }
      }
      else{
        private$.mat = self$mat[rows,cols,drop=FALSE]
        if(length(private$.rowData)>0){
          private$.rowData <- lapply(
            private$.rowData,function(x){x[rows,drop=FALSE]}
          )
        }
        if(length(private$.colData)>0){
          private$.colData <- lapply(
            private$.colData,function(x){x[cols,drop=FALSE]}
          )
        }
      }
      private$.nrow = nrow(private$.mat)
      private$.rnames = rownames(private$.mat)
      private$.ncol = ncol(private$.mat)
      private$.cnames = colnames(private$.mat)
    },
    head = function(k,direction=2){
      if('head' %in% private$.debug){
        browser()
      }
      if(k>dim(private$.mat)[[direction]]){
        stop("The size of the head is too large.")
      }
      indices = 1:k
      if(direction==1){
        private$.mat = self$mat[indices,,drop=FALSE]
        if(length(private$.rowData)>0){
          for(i in 1:length(private$.rowData)){
            private$.rowData[[i]] = private$.rowData[[i]][indices,drop=FALSE]
          }
        }
      }
      else if(direction==2){
        private$.mat = self$mat[,indices,drop=FALSE]
        if(length(private$.colData)>0){
          for(i in 1:length(private$.colData)){
            private$.colData[[i]] = private$.colData[[i]][indices,drop=FALSE]
          }
        }
      }
      else{
        stop("This direction is not allowed.")
      }
      private$.nrow = nrow(private$.mat)
      private$.ncol = ncol(private$.mat)
      private$.cnames = colnames(private$.mat)
      private$.rnames = rownames(private$.mat)
    },
    tail = function(k,direction=2){
      if('tail' %in% private$.debug){
        browser()
      }
      if(k>dim(private$.mat)[[direction]]){
        stop("The size of the tail is too large.")
      }
      indices = (dim(self$mat)[[direction]]-k+1):dim(self$mat)[[direction]]
      if(direction==1){
        private$.mat = self$mat[indices,,drop=FALSE]
        if(length(private$.rowData)>0){
          for(i in 1:length(private$.rowData)){
            private$.rowData[[i]] = private$.rowData[[i]][indices,drop=FALSE]
          }
        }
      }
      else if(direction==2){
        private$.mat = self$mat[,indices,drop=FALSE]
        if(length(private$.colData)>0){
          for(i in 1:length(private$.colData)){
            private$.colData[[i]] = private$.colData[[i]][indices,drop=FALSE]
          }
        }
      }
      else{
        stop("This direction is not allowed.")
      }
      private$.nrow = nrow(private$.mat)
      private$.ncol = ncol(private$.mat)
      private$.cnames = colnames(private$.mat)
      private$.rnames = rownames(private$.mat)
    },
    lag = function(indices,mutate=TRUE,na.rm=FALSE){
      if('lag' %in% private$.debug){
        browser()
      }
      if(mutate==FALSE){
        tmp = self$clone(TRUE)
        tmp$lag(indices=indices,mutate=TRUE,na.rm=na.rm)
        return(tmp)
      }
      if((1+max(indices)) > self$ncol){
        stop("We cannot go further back than the start of the matrix")
      }
      numLags = length(indices)
      oldNrow = self$nrow
      if(is.null(rownames(private$.mat))){
        rownames(private$.mat) = 1:(dim(private$.mat)[[1]])
      }
      rownames = replicate(numLags,rownames(private$.mat))
      colnames = colnames(private$.mat)
      private$.mat <- 0+array(self$mat,c(dim(self$mat),numLags))
      if(numLags <= 0){
        stop("indices must be nonempty for the calculation of lags to make sense.")
      }
      for(lag in 1:numLags){
        private$.mat[,(1+indices[[lag]]):self$ncol,lag] <-
          private$.mat[,1:(self$ncol-indices[[lag]]),lag]
        if(indices[[lag]] > 0){
          private$.mat[,1:(indices[[lag]]),lag] = NA
        }
      }
      private$.mat = aperm(private$.mat,c(1,3,2))
      private$.mat = matrix(private$.mat,self$nrow*numLags,self$ncol)
      lagnames = t(replicate(self$nrow,paste('L',indices,sep='')))
      rownames(private$.mat) <-
        as.character(paste(lagnames,"R",rownames,sep=''),numLags*self$nrow)
      colnames(private$.mat) <- colnames
      private$.nrow = self$nrow * numLags
      private$.rnames = rownames(private$.mat)
      if(length(private$.rowData) > 0){
        private$.rowData <- lapply(
          private$.rowData,
          function(x){
            c(unlist(recursive=FALSE,lapply(1:numLags,function(y){x})))
          }
        )
      }
      if(na.rm==T){
        self$subset(cols=!apply(private$.mat,2,function(x){any(is.na(x))}))
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
      private$.mat[] = f(private$.mat[])
    },
    diff = function(lag = 1,mutate=TRUE){
      if('diff' %in% private$.debug){
        browser()
      }
      if(lag == 0){
        if(!is.null(private$.rnames)){
          rownames(private$.mat) =
            paste("D",lag,"R",private$.rnames,sep='')
          private$.rnames = rownames(private$.mat)
        } else {
          rownames(private$.mat) =
            paste("D",lag,"R",1:private$.nrow,sep='')
          private$.rnames = rownames(private$.mat)
        }
        return()
      }
      if(lag < 0){
        stop("Lag should be non-negative.")
      }
      if(!mutate){
        tmp = self$clone(TRUE)
        tmp$diff(lag=lag,mutate=TRUE)
        return(tmp)
      }
      private$.mat <-
        self$mat - self$lag(indices=lag,mutate=FALSE,na.rm=FALSE)$mat
      if(!is.null(private$.rnames)){
        rownames(private$.mat) =
          paste("D",lag,"R",private$.rnames,sep='')
        private$.rnames = rownames(private$.mat)
      } else {
        rownames(private$.mat) =
          paste("D",lag,"R",1:private$.nrow,sep='')
        private$.rnames = rownames(private$.mat)
      }
    },
    addColumns = function(columns){
      if('addColumns' %in% private$.debug){
        browser()
      }
      if(columns == 0){
        return()
      }
      cbind(private$.mat , matrix(NA,private$.nrow,columns)) -> private$.mat
      private$.ncol = ncol(private$.mat)
      if(!is.null(private$.cnames)){
        colnames(private$.mat) = c(private$.cnames,replicate(columns,"NA"))
        private$.cnames = colnames(private$.mat)
      }
      if(length(private$.colData) > 0){
        private$.colData <- lapply(
          private$.colData,
          function(x){
            c(x,replicate(columns,NA))
          }
        )
      }
    },
    addRows = function(rows){
      if('addRows' %in% private$.debug){
        browser()
      }
      if(rows == 0){
        return()
      }
      rbind(private$.mat , matrix(NA,rows,private$.ncol)) -> private$.mat
      private$.nrow = nrow(private$.mat)
      if(!is.null(private$.rnames)){
        rownames(private$.mat) = c(private$.rnames,replicate(rows,"NA"))
        private$.rnames = rownames(private$.mat)
      }
      if(length(private$.rowData) > 0){
        private$.rowData <- lapply(
          private$.rowData,
          function(x){
            c(x,replicate(rows,NA))
          }
        )
      }
    },
    mutate = function(rows,cols,data){
      if('mutate' %in% private$.debug){
        browser()
      }
      data = as.matrix(data)
      if(missing(rows)){
        rows = 1:private$.nrow
        if(!(is.null(private$.cnames) || is.null(colnames(data)))){
          private$.cnames[cols] = colnames(data)
          colnames(private$.mat) = private$.cnames
        }
      }
      if(missing(cols)){
        cols = 1:private$.ncol
        if(!(is.null(private$.rnames) || is.null(rownames(data)))){
          private$.rnames[rows] = rownames(data)
          rownames(private$.mat) = private$.rnames
        }
      }
      if(is.null(dim(data))){
        stop("Not yet implemented for non-matrixlike objects")
      }
      if(length(dim(data)) > 2){
        stop("There are too many dimensions in data.")
      }
      if(length(dim(data)) == 2){
        private$.mat[rows,cols] = data
      }
    }
  ),
  active = list(
    mat = function(value){
      "The matrix of data."
      if('mat' %in% private$.debug){
        browser()
      }
      if(missing(value)){
        return(private$.mat)
      }
      stop(
        "Do not write directly to the mat. Either use methods to modify the mat,
         or create a new instance."
      )
    },
    colData = function(value){
      "The metaData associated with column in the matrix"
      if('colData' %in% private$.debug){
        browser()
      }
      if(missing(value)){
        if(length(private$.colData) > 0){
          for(i in 1:length(private$.colData)){
            if(private$.ncol != length(private$.colData[[i]])){
              stop("If you alter the matrix, please also edit the column metaData.")
            }
          }
        }
        return(private$.colData)
      }
      if(class(value) != 'list'){
        stop("Column metaData should be a list of lists.")
      }
      if(length(value)>0){
        for(i in 1:length(value)){
          if(
            Reduce(
              '&&',
              class(value[[i]]) !=
                c(
                  'list',
                  'character',
                  'numeric',
                  'integer',
                  'logical',
                  'raw',
                  'complex'
                )
            )
          ){
            if(dim(as.matrix(value[[i]]))[[1]] != private$.ncol){
              stop(paste(
                'The ',
                i,
                'th element of column metaData does not have one element for',
                'each column.',
                sep=''
              ))
            }
          }
          else{
            if(length(value[[i]])!=private$.ncol){
              stop(paste(
                'The ',
                i,
                'th element of column metaData does not have one element for',
                'each column.',
                sep=''
              ))
            }
          }
        }
      }
      private$.colData <- value
      if(length(private$.colData) > 0){
        for(i in 1:length(private$.colData)){
          names(private$.colData[[i]]) <- colnames(self$mat)
        }
      }
    },
    rowData = function(value){
      "The metaData associated with rows in the matrix"
      if('rowData' %in% private$.debug){
        browser()
      }
      if(missing(value)){
        if(length(private$.rowData) > 0){
          for(i in 1:length(private$.rowData)){
            if(private$.nrow != length(private$.rowData[[i]])){
              stop("If you alter the matrix, please also edit the row metaData.")
            }
          }
        }
        return(private$.rowData)
      }
      if(class(value) != 'list'){
        stop("row metaData should be a list of lists.")
      }
      if(length(value) > 0){
        for(i in 1:length(value)){
          if(
            Reduce('&&',
              class(value[[i]]) !=
                c(
                  'list',
                  'character',
                  'numeric',
                  'integer',
                  'logical',
                  'raw',
                  'complex'
                )
            )
          ){
            if(dim(as.matrix(value[[i]]))[[1]] != private$.nrow){
              stop(paste(
                'The ',
                i,
                'th element of row metaData does not have one element for each',
                'row.',
                sep=''
              ))
            }
          }
          else{
            if(length(value[[i]])!=private$.nrow){
              stop(paste(
                'The ',
                i,
                'th element of row metaData does not have one element for each',
                'row.',
                sep=''
              ))
            }
          }
        }
      }
      private$.rowData <- value
      if(length(private$.rowData)>0){
        for(i in 1:length(value)){
          names(private$.rowData[[i]]) <- rownames(self$mat)
        }
      }
    }
  )
)



