library(DirectEffects)


### Name: cdesens
### Title: Estimate sensitivity of ACDE estimates under varying levels of
###   unobserved confounding
### Aliases: cdesens

### ** Examples

data(civilwar)


# main formula: Y ~ A + X | Z | M
form_main <- onset ~ ethfrac + lmtnest + ncontig + Oil | warl +
  gdpenl + lpop + polity2l + relfrac | instab

# estimate CDE
direct <- sequential_g(form_main, data = civilwar)

# sensitivity
out_sens <- cdesens(direct, var = "ethfrac")

# plot sensitivity
plot(out_sens)




