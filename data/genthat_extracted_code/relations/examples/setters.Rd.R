library(relations)


### Name: setters
### Title: Modify Relations
### Aliases: relation_domain<- relation_domain_names<- relation_graph<-
###   relation_incidence<-
### Keywords: math

### ** Examples

R <- as.relation(1 : 3)
print(R)

relation_domain(R)
## tuple format:
require("sets")				# set(), pair() etc.
relation_domain(R) <- pair(X = set("a","b","c"), Y = set("A","B","C"))
relation_domain(R)
## the same in list format:
relation_domain(R) <- list(X = letters[1:3], Y = LETTERS[1:3])
relation_domain(R)

relation_domain_names(R) <- c("XX","YY")
relation_domain_names(R)

relation_incidence(R)
relation_incidence(R) <- diag(1, 3, 3)
relation_incidence(R)

relation_graph(R)
## set format:
relation_graph(R) <- set(pair("a","B"), pair("a","C"), pair("b","C"))
relation_graph(R)
## the same in data frame format:
relation_graph(R) <-
    data.frame(c("a", "a", "b"), c("B", "C", "C"),
               stringsAsFactors = FALSE)
relation_graph(R)




