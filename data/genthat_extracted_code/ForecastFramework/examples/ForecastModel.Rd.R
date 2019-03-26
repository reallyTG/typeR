library(ForecastFramework)


### Name: ForecastModel
### Title: ForecastModel
### Aliases: ForecastModel

### ** Examples

Ar1Model <- R6Class(
    inherit=ForecastModel,
    private= list(
        data = MatrixData$new(),
        newdata = IncidenceMatrix$new(),
        model = NULL
    ),
    public = list (
        fit = function(data) {
            private$data = data$clone(TRUE)
        },
        predict = function(newdata=private$data) {
            private$newdata = IncidenceMatrix$new(newdata)
            private$newdata$lead(1)
            
            return(SimpleForecast$new(private$newdata))
        },
        forecast = function(steps,newdata=private$data) {
            private$newdata = IncidenceMatrix$new(newdata)
            if(steps >= private$newdata$ncol)
              stop("Not enough columns.")
            private$newdata$lead(steps)
            private$newdata$subset(cols = 1:(private$newdata$ncol-steps))
            return(SimpleForecast$new(private$newdata))
        }
        
    )
)

data = ObservationList$new(data.frame(x=1:1000 %% 3,y=1:1000 %% 10,z = 1:1000))
data$formArray('x','y',val='z')
model = Ar1Model$new()




