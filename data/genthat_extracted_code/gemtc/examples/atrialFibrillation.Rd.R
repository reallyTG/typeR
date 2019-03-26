library(gemtc)


### Name: atrialFibrillation
### Title: Prevention of stroke in atrial fibrillation patients
### Aliases: atrialFibrillation

### ** Examples

# Build a model similar to Model 4(b) from Cooper et al. (2009):
classes <- list("control"=c("01"),
                "anti-coagulant"=c("02","03","04","09"),
                "anti-platelet"=c("05","06","07","08","10","11","12","16","17"),
                "mixed"=c("13","14","15"))

regressor <- list(coefficient='shared',
                  variable='stroke',
                  classes=classes)

model <- mtc.model(atrialFibrillation,
                   type="regression",
                   regressor=regressor,
                   om.scale=10)

## Not run: 
##D result <- mtc.run(model)
## End(Not run)



