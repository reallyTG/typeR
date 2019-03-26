library(RSiena)


### Name: setEffect
### Title: Function to set various columns in an effects object in a Siena
###   model.
### Aliases: setEffect
### Keywords: classes

### ** Examples

mynet <- sienaDependent(array(c(s501, s502, s503), dim=c(50, 50, 3)))
mybeh <- sienaDependent(s50a, type="behavior")
mydata <- sienaDataCreate(mynet, mybeh)
myeff <- getEffects(mydata)
# Set the initial rate parameter for one period:
myeff <- setEffect(myeff, Rate, initialValue=1.5, name="mybeh",
                   type="rate", period=2)
# Specify an effect parameter:
myeff <- setEffect(myeff, outTrunc, parameter=1)
myeff
# Now request the interaction between reciprocity and alcohol similarity
# to be tested without estimation.
myeff <- includeInteraction(myeff, recip, simX, interaction1=c("", "mybeh"))
myeff
# The following code uses the fact that the interaction effect is number 6.
# In practice one would just look up the numbers of effect1 and effect2
# from the response to \code{myeff} and fill them in.
(eff1 <- myeff[myeff$include,]$effect1[6])
(eff2 <- myeff[myeff$include,]$effect2[6])
myeff <- setEffect(myeff, unspInt, fix=TRUE, test=TRUE,
                                    effect1=eff1, effect2=eff2)
myeff



