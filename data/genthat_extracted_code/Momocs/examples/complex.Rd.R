library(Momocs)


### Name: complex
### Title: Convert complex to/from cartesian coordinates
### Aliases: complex cpx2coo coo2cpx

### ** Examples

shapes[4] %>%            # from cartesian
    coo_sample(24) %>%
    coo2cpx() %T>%       # to complex
    cpx2coo()            # and back



