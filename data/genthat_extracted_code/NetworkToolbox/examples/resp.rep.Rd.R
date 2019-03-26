library(NetworkToolbox)


### Name: resp.rep
### Title: Repeated Responses Check
### Aliases: resp.rep

### ** Examples

#Re-reverse responses
rev.vec <- c(TRUE,FALSE,TRUE,FALSE,TRUE,TRUE,TRUE,FALSE,TRUE,FALSE,
TRUE,FALSE,FALSE,TRUE,FALSE,TRUE,FALSE,TRUE,TRUE,FALSE,TRUE,FALSE,TRUE,
FALSE,FALSE,TRUE,FALSE,TRUE,FALSE,TRUE,TRUE,FALSE,TRUE,FALSE,TRUE,
FALSE,TRUE,FALSE,FALSE,TRUE,FALSE,TRUE,TRUE,FALSE,FALSE,TRUE,FALSE,TRUE)

#Maximum value (5-point Likert scale)
mv.vec <- 5

#Repeated responses check
resp.rep(neoOpen, reverse = rev.vec, max.val = mv.vec)

#Example with multiple scales

#Facet scale lengths of NEO-PI-3 Openness to Experience
s.len <- c(8, 8, 8, 8, 8, 8)

#Maximum values
mv.vec <- c(5, 5, 5, 5, 5, 5)

#Re-reverse responses
rev.vec <- c(TRUE,FALSE,TRUE,FALSE,TRUE,TRUE,TRUE,FALSE,TRUE,FALSE,
TRUE,FALSE,FALSE,TRUE,FALSE,TRUE,FALSE,TRUE,TRUE,FALSE,TRUE,FALSE,TRUE,
FALSE,FALSE,TRUE,FALSE,TRUE,FALSE,TRUE,TRUE,FALSE,TRUE,FALSE,TRUE,
FALSE,TRUE,FALSE,FALSE,TRUE,FALSE,TRUE,TRUE,FALSE,FALSE,TRUE,FALSE,TRUE)

#Repeated responses check
resp.rep(neoOpen, scale.lens = s.len, max.val = mv.vec, reverse = rev.vec)




