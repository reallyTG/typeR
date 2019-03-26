library(broom)


### Name: tidy.Kendall
### Title: Tidy a(n) Kendall object
### Aliases: tidy.Kendall Kendall_tidiers kendall_tidiers

### ** Examples

library(Kendall)

A <- c(2.5,2.5,2.5,2.5,5,6.5,6.5,10,10,10,10,10,14,14,14,16,17)
B <- c(1,1,1,1,2,1,1,2,1,1,1,1,1,1,2,2,2)

f_res <- Kendall(A, B)
tidy(f_res)

s_res <- MannKendall(B)
tidy(s_res)

t_res <- SeasonalMannKendall(ts(A))
tidy(t_res)




