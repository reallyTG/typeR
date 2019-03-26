library(distrr)


### Name: only_joint
### Title: Keeps only joint distribution (removes '.total').
### Aliases: only_joint

### ** Examples

data(invented_wages)
str(invented_wages)

vars <- c("gender", "education")
tmp <- dcc2(.data = invented_wages, 
            .variables = vars, 
            .fun = jointfun_, 
            order_type = extract_unique2)
tmp
str(tmp)
only_joint(tmp, .variables = vars)

# Compare dimensions (number of groups)
dim(tmp)
dim(only_joint(tmp, .variables = vars))



