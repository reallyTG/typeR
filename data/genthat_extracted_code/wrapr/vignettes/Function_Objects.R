## ----lm1-----------------------------------------------------------------
d <- data.frame(
  x = c(1, 2, 3, 4, 5), 
  y = c(3, 5, 20, 50, 150))

model <- lm(log(y) ~ x, data = d)

## ------------------------------------------------------------------------
exp(predict(model, newdata = d))

## ----lm2-----------------------------------------------------------------
d2 <- data.frame(x = 3:7)

exp(predict(model, newdata = d2))

## ----lmf-----------------------------------------------------------------
library("wrapr")

model_f <- function(df) {
  exp(predict(model, newdata = df))
}

d2 %.>% model_f

## ----lms3_1--------------------------------------------------------------
model_o <-
  fnlist(
    pkgfn(
      "stats::predict.lm",
      arg_name = "newdata", 
      args = list(object = model)),
    pkgfn(
      "exp",
      arg_name = "x"))
  

cat(format(model_o))

## ----lms3pipe------------------------------------------------------------
d2 %.>% model_o

## ----lms3nopipe----------------------------------------------------------
ApplyTo(model_o, d2) 

## ----lst-----------------------------------------------------------------
pred_step <- pkgfn(
  "stats::predict.lm",
  arg_name = "newdata", 
  args = list(object = model))

exp_step <- pkgfn(
  "base::exp",
  arg_name = "x")

d2 %.>% pred_step %.>% exp_step

## ----ppl-----------------------------------------------------------------
model_p <- pred_step %.>% exp_step

cat(format(model_p))

d2 %.>% model_p

## ----lst3----------------------------------------------------------------
ApplyTo(model_p, d2)

## ----listp1--------------------------------------------------------------
model_p@items

## ----specfn--------------------------------------------------------------
s4 <- srcfn(
  qe(. + y), 
  arg_name = ".", 
  args= list(y=13))
print(s4)
22 %.>% s4

s5 <- wrapfn(
  tan, 
  arg_name = "x")
print(s5)
1:4 %.>% s5

## ----as_fn---------------------------------------------------------------
f5 <- as_fn(s5)

f5(1:5)

1:5 %.>% f5

