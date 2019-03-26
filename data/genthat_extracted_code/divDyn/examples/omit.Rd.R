library(divDyn)


### Name: omit
### Title: Omission of taxa that have a poor occurrence record
### Aliases: omit

### ** Examples

# omit single-reference taxa
  data(corals)
  data(stages)
  toOmit <- omit(corals, bin="stg", tax="genus", om="ref")
  dat <- corals[!toOmit,]

# within divDyn
  # plotting
  tsplot(stages, shading="series", boxes="sys", xlim=c(260,0), 
    ylab="range-through diversity (genera)", ylim=c(0,230))
  # multiple ref/slice required
  ddNoSing <- divDyn(corals, tax="genus", bin="stg", om="binref")
  lines(stages$mid, ddNoSing$divRT, lwd=2, col="red")

  # with the recent included (NA reference value)
  ddNoSingRec <- divDyn(corals, tax="genus", bin="stg",
    om="binref", filterNA=TRUE)
  lines(stages$mid, ddNoSingRec$divRT, lwd=2, col="blue")
  
  # legend
  legend("topleft", legend=c("no single-ref. taxa", 
    "no single-ref. taxa,\n with recent"), 
    col=c("red", "blue"), lwd=c(2,2))



