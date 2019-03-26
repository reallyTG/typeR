library(edpclient)


### Name: display_name
### Title: Display Names
### Aliases: display_name display_name<- display_names display_names<-

### ** Examples

  d <- data.frame(inc = c(25, NA, 17), age = c(21, 70, 30))
  display_name(d$inc) <- "income (thousands of USD)"
  dn <- display_names(d)  # returns c(inc = "income (thousands of USD)", age = NA)
  ## Don't show: 
    stopifnot(isTRUE(all.equal(dn, c(inc = "income (thousands of USD)", age = NA))))
  
## End(Don't show)



