library(CDM)


### Name: osink
### Title: Opens and Closes a 'sink' Connection
### Aliases: osink csink

### ** Examples

## The function 'osink' is currently defined as
function (file, suffix){
    if (!is.null(file)) {
        base::sink(paste0(file, suffix), split=TRUE)
       }
  }

## The function 'csink' is currently defined as
function (file){
    if (!is.null(file)) {
        base::sink()
        }
  }



