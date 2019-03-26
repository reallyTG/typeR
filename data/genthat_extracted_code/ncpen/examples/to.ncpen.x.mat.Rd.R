library(ncpen)


### Name: to.ncpen.x.mat
### Title: Convert a 'data.frame' to a 'ncpen' usable 'matrix'.
### Aliases: to.ncpen.x.mat

### ** Examples

df = data.frame(num = c(1, 2, 3, 4, 5),
                ctr = c("K", "O", "R", "R", "K"),
                logi = c(TRUE, TRUE, FALSE, FALSE, TRUE),
                age = c(10, 20, 30, 40, 50),
                age_sq = c(10, 20, 30, 40, 50)^2,
                loc = c("b", "a", "c", "a", "b"),
                FTHB = c(1,0,1,0,1),
                PRM  = c(0,1,0,1,0),
                PMI  = c(1,1,0,0,0));

to.ncpen.x.mat(df, interact.all = TRUE,
   base.cols = c("age"),
   exclude.pair = list(c("FTHB", "PRM")));






