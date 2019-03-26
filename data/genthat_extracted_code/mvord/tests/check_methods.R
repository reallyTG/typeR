library(mvord)
data(data_mvord_toy)
tolerance <- 1e-6

# convert data_mvord_toy into long format
df <- cbind.data.frame("i" = rep(1:100,2), "j" = rep(1:2,each = 100),
                       "Y" = c(data_mvord_toy$Y1,data_mvord_toy$Y2),
                       "X1" = rep(data_mvord_toy$X1,2),
                       "X2" = rep(data_mvord_toy$X2,2),
                       "f1" = factor(sample(rep(data_mvord_toy$Y2,2)), ordered =F),
                       "f2" = factor(rep(data_mvord_toy$Y1,2), ordered=F))

df_NA <- df[-c(1,90:110),]


res <- mvord:::mvord(formula = MMO(Y, i, j) ~ 0 + X1 + X2,
                     data = df_NA,
                     #index = c("i", "j"),
                     link = mvprobit(),
                     control = mvord.control(solver = "newuoa"),
                     #se = T,
                     error.structure = cor_general(~1),
                     threshold.constraints = c(1,2),
                     coef.constraints = c(1,1))



print(res)
summary(res)
print(summary(res))

coef(res)
thresholds(res)
AIC(res)
BIC(res)


logLik(res)
nobs(res)
vcov(res)
terms(res)
model.matrix(res)


fitted(res)

constraints(res)

names_constraints(Y ~ 0 + X1 + X2, df_NA)

#predict functions
marginal_predict(res, type = "prob", subjectID = c(2,5,32,88))
marginal_predict(res, type = "class", subjectID = c(2,5,32,88)+2)
marginal_predict(res, type = "class")
marginal_predict(res, type = "cum.prob", subjectID = c(2,5,32,88)+8)
predict(res, type = "prob", subjectID = c(3,6,33,55,90))
predict(res, type = "class", subjectID = c(3,6,33,55,90)+1)
predict(res, type = "cum.prob", subjectID = c(3,6,33,55,90)+2)
joint_probabilities(res, response.cat = c(1,2))
joint_probabilities(res, response.cat = res$rho$y)
joint_probabilities(res, type = "cum.prob", response.cat = c(1,2))

error_structure(res)

newdata <- df[1:20,]
newdata[,"i"] <- rep(1:10,2)
newdata[,"j"] <- rep(1:2, each=10)
#newdata[,"Y"] <- NA

marginal_predict(res, type = "prob", newdata = newdata)#subjectID = c(2,5,32,88))
marginal_predict(res, type = "class", newdata = newdata)#subjectID = c(2,5,32,88)+2)
marginal_predict(res, type = "linpred", newdata = newdata)
marginal_predict(res, type = "cum.prob",  newdata = newdata)
marginal_predict(res, type = "all.prob",  newdata = newdata)


predict(res, type = "prob", newdata=newdata)
predict(res, type = "class", newdata=newdata, subjectID = c(1:5))
predict(res, type = "cum.prob", newdata=newdata)

joint_probabilities(res, response.cat = c(1,2), newdata=newdata)
mat <-  matrix(sample(1:3, 20, replace=T),ncol=2)
joint_probabilities(res, response.cat = mat,
  newdata=newdata)
joint_probabilities(res, response.cat = mat,
  type = "cum.prob", newdata=newdata)
joint_probabilities(res, response.cat = mat,
  type = "cum.prob", newdata=newdata, subjectID = c(1,3))

