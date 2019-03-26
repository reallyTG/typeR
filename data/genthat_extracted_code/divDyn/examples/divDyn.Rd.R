library(divDyn)


### Name: divDyn
### Title: Time series from metrics of diversity dynamics
### Aliases: divDyn

### ** Examples

# import data
  data(corals)
  data(stages)

# calculate metrics of diversity dynamics
   dd <- divDyn(corals, tax="genus", bin="stg")

# plotting
  tsplot(stages, shading="series", boxes="sys", xlim=c(260,0), 
    ylab="range-through diversity (genera)", ylim=c(0,230))
  lines(stages$mid, dd$divRT, lwd=2)

 # with omission of single reference taxa  
   ddNoSing <- divDyn(corals, tax="genus", bin="stg", om="ref")
   lines(stages$mid, ddNoSing$divRT, lwd=2, col="red")

 # using the estimated ages (less robust) - 10 million years
   # mean ages
   corals$me_ma <- apply(corals[, c("max_ma", "min_ma")], 1, mean)
   # ages reverse the direction of time! set ages to TRUE in this case
   ddRadio10 <- divDyn(corals, tax="genus", bin="me_ma", 
	breaks=seq(250,0,-10), ages=TRUE)
   lines(ddRadio10$bin, ddRadio10$divRT, lwd=2, col="green")
      
 # legend
   legend("topleft", legend=c("all", "no single-ref. taxa", "all, estimated ages"), 
     col=c("black", "red", "green"), lwd=c(2,2,2), bg="white")
   




