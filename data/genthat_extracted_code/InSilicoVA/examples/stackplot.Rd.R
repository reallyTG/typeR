library(InSilicoVA)


### Name: stackplot
### Title: plot grouped CSMF from a "insilico" object
### Aliases: stackplot
### Keywords: InSilicoVA

### ** Examples

## No test: 
  data(RandomVA1) 
  ##
  ## Scenario 1: without sub-population specification
  ##
  fit1<- insilico(RandomVA1, subpop = NULL,  
                Nsim = 1000, burnin = 500, thin = 10 , seed = 1,
                auto.length = FALSE)
  # stack bar plot for grouped causes
  # the default grouping could be seen from
  data(SampleCategory)
  stackplot(fit1, type = "dodge", xlab = "")
  
  ##
  ## Scenario 2: with sub-population specification
  ##
  data(RandomVA2)
  fit2<- insilico(RandomVA2, subpop = list("sex"),  
                Nsim = 1000, burnin = 500, thin = 10 , seed = 1,
                auto.length = FALSE)
  stackplot(fit2, type = "stack", angle = 0)
  stackplot(fit2, type = "dodge", angle = 0)
  # Change the default grouping by separating TB from HIV
  data(SampleCategory)
  SampleCategory[c(3, 9), ]
  SampleCategory[3, 2] <- "HIV/AIDS"
  SampleCategory[9, 2] <- "TB"
  stackplot(fit2, type = "stack", grouping = SampleCategory, 
            sample.size.print = TRUE, angle = 0)
  stackplot(fit2, type = "dodge", grouping = SampleCategory,
            sample.size.print = TRUE, angle = 0)
  
  # change the order of display for sub-population and cause groups
  groups <- c("HIV/AIDS", "TB", "Communicable", "NCD", "External",
              "Maternal", "causes specific to infancy") 
  subpops <- c("Women", "Men")
  stackplot(fit2, type = "stack", grouping = SampleCategory, 
            order.group = groups, order.sub = subpops, 
            sample.size.print = TRUE, angle = 0)	
## End(No test) 



