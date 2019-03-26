library(Biograph)


### Name: Lexis.points
### Title: Plots ages and calendar years at transitions in Lexis diagram
### Aliases: Lexis.points

### ** Examples

#  Example 1: ages at labour market entry, by sex
  data(GLHS)
  #y <- Parameters(GLHS)
  t <- "Date and age at labour market entry by sex and cohort"
  z <- Lexis.points (GLHS,"NJ",title=t,cov="sex",group="cohort",legend.pos="right",pdf=FALSE)

#  Example 2: ages at first birth among married women, by religious denomination
  data(NLOG98)
  y <- Parameters (NLOG98)
  t <- "Date and age at first birth (married women) by religion and cohort"
  z <- Lexis.points (NLOG98,"MK",title=t,cov="kerk",group="cohort",legend.pos="right",pdf=FALSE)
#  Example 3: ages at leaving home, by birth cohort (any destination)
  t <- "Date and age at leaving parental home by religion and education"
  z <- c(0.7,0.2)
  z <- Lexis.points (NLOG98,"H*",title=t,cov="kerk",group="educ",legend.pos=z,pdf=FALSE)  
  


