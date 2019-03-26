library(itsadug)


### Name: get_difference
### Title: Get model predictions for differences between conditions.
### Aliases: get_difference

### ** Examples

data(simdat)

# first fit a simple model:
m1 <- bam(Y ~ Group+te(Time, Trial, by=Group), data=simdat)

# get difference estimates:
diff <- get_difference(m1, comp=list(Group=c('Adults', 'Children')), 
    cond=list(Time=seq(0,500,length=100)))
head(diff)



