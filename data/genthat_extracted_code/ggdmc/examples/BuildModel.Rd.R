library(ggdmc)


### Name: BuildModel
### Title: Create a model object
### Aliases: BuildModel print.model print.dmi

### ** Examples

model <- BuildModel(
        p.map     = list(a = "1", v = "1", z = "1", d = "1", t0 = "1",
                     sv = "1", sz = "1", st0 = "1"),
        constants = c(st0 = 0, d = 0, sz = 0, sv = 0),
        match.map = list(M = list(s1 = "r1", s2 = "r2")),
        factors   = list(S = c("s1", "s2")),
        responses = c("r1", "r2"),
        type      = "rd")



