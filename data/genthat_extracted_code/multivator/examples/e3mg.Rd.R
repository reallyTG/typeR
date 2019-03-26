library(multivator)


### Name: e3mg
### Title: Output from computer model e3mg
### Aliases: e3mg e3mg_LoF
### Keywords: datasets

### ** Examples

data(e3mg)
a <- lm(rec_len~oil.price*direct.tax + direct.tax*saving.ratio + investment,data=data.frame(e3mg))
b <- lm(rec_dep~oil.price*direct.tax + direct.tax*saving.ratio + investment,data=data.frame(e3mg))
plot(residuals(a),residuals(b))  # correlated!



# define an experiment object and find optimal prarams
e3mg_expt <- apart(e3mg[1:20,],6:7)
opt <- optimal_params(e3mg_expt, e3mg_LoF, option='c')


# now a point in parameter space:
center <- get_mdm(e3mg_expt)[c(1,40),]
rownames(center) <- c('center_dep','center_len')
xold(center) <- 0


#now predict the behaviour at the center:
multem(center, e3mg_expt, hp=opt, e3mg_LoF, give = TRUE)





