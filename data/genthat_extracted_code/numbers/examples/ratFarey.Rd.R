library(numbers)


### Name: ratFarey
### Title: Farey Approximation
### Aliases: ratFarey

### ** Examples

    ratFarey(pi, 100)                          # 22/7    0.0013
    ratFarey(pi, 100, upper = FALSE)           # 311/99  0.0002
    ratFarey(-pi, 100)                         # -22/7
    ratFarey(pi - 3, 70)                       # pi ~= 3 + (3/8)^2
    ratFarey(pi, 1000)                         # 355/113
    ratFarey(pi, 10000, upper = FALSE)         # id.
    ratFarey(pi, 1e5, upper = FALSE)           # 312689/99532 - pi ~= 3e-11

    ratFarey(4/5, 5)                           # 4/5
    ratFarey(4/5, 4)                           # 1/1
    ratFarey(4/5, 4, upper = FALSE)            # 3/4



