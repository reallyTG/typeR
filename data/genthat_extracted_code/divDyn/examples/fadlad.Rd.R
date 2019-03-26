library(divDyn)


### Name: fadlad
### Title: FAD - LAD matrix from occurrence data
### Aliases: fadlad

### ** Examples

data(corals)

# binned data
  flBinned <- fadlad(corals, tax="genus", bin="stg")

# using basic bin lengths
  flDual <- fadlad(corals, tax="genus", bin=c("max_ma", "min_ma"), ages=TRUE)

# single age esimate 
  data(stages)
  corals$mid <- stages$mid[corals$stg]
  flSingle <- fadlad(corals, tax="genus", bin="mid", ages=TRUE)





