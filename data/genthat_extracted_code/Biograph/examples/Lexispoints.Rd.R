library(Biograph)


### Name: Lexispoints
### Title: Plot event dates and ages in Lexis diagram
### Aliases: Lexispoints

### ** Examples

#  Example 1: ages at labour market entry, by sex
  library (Epi)
  data(GLHS)
  #y <- Parameters(GLHS)
  t <- "Calendar time and age at labour market entry"
  z <- Lexispoints (Bdata=GLHS,transition="NJ",title=t,cov="sex",legend="topleft")

#  Example 2: ages at first birth among married women, by religious denomination
  data(NLOG98)
  y <- Parameters (NLOG98)
  t <- "Calendar time and age at first birth (married women)"
  z <- Lexispoints (NLOG98,"MK",t,"kerk")
#  Example 3: ages at leaving home, by birth cohort (any destination)
  t <- "Calendar time and age at leaving parental home"
  z <- Lexispoints (NLOG98,"H*",t,"cohort","topleft")  
  


