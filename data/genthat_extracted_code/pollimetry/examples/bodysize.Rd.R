library(pollimetry)


### Name: bodysize
### Title: Converts the intertegular distance (IT) and co-variates to body
###   size in dry weight (mg) for bees or hoverflies.
### Aliases: bodysize

### ** Examples

example=cbind.data.frame(IT=c(1.3,2.3),
                         Sex=c("Female","Male"), 
                         Subfamily=c("Syrphinae","Eristalinae"),
                         Region=c("Australasia","Europe"),
                         Species=c("Sphaerophoria_macrogaster","Myathropa_florea"))
bodysize(x=example,taxa="hov",type="taxo")




