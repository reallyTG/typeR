library(sommer)


### Name: fcm
### Title: fixed effect constraint indication matrix
### Aliases: fcm

### ** Examples

fcm(c(1,1,0))
fcm(c(0,1,1))
fcm(c(1,1,1))

# ## model with Env estimated for both traits
# ans4 <- mmer(cbind(Yield, Weight) ~ Env,
#               random= ~ vs(Name) + vs(Env:Name),
#               rcov= ~ vs(units),
#               data=DT)
# summary(ans4)$betas
# ## model with Env only estimated for Yield
# ans4b <- mmer(cbind(Yield, Weight) ~ vs(Env, Gtc=fcm(c(1,0))),
#              random= ~ vs(Name) + vs(Env:Name),
#              rcov= ~ vs(units),
#              data=DT)
# summary(ans4b)$betas




