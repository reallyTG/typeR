library(distrr)


### Name: dcc
### Title: Data cube creation (dcc)
### Aliases: dcc dcc2 dcc5

### ** Examples

data("invented_wages")
str(invented_wages)
tmp <- dcc(.data = invented_wages, 
           .variables = c("gender", "sector"), .fun = jointfun_)
tmp
str(tmp)
tmp2 <- dcc2(.data = invented_wages, 
            .variables = c("gender", "education"), 
            .fun = jointfun_, 
            order_type = extract_unique2)
tmp2
str(tmp2)

# dcc5 works like dcc2, but has an additional optional argument, .total,
# that can be added to give a name to the groups that include all the 
# observations of a variable.
tmp5 <- dcc5(.data = invented_wages, 
            .variables = c("gender", "education"),
            .fun = jointfun_,
            .total = "TOTAL",
            order_type = extract_unique2)
tmp5




