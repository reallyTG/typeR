library(iprior)


### Name: kernL
### Title: Load the kernel matrices for I-prior models
### Aliases: kernL kernL.formula

### ** Examples


str(ToothGrowth)
(mod <- kernL(y = ToothGrowth$len,
               supp = ToothGrowth$supp,
               dose = ToothGrowth$dose,
               interactions = "1:2"))
kernL(len ~ supp * dose, data = ToothGrowth)  # equivalent formula call

# Choosing different kernels
str(stackloss)
kernL(stack.loss ~ ., stackloss, kernel = "fbm")  # all fBm kernels
kernL(stack.loss ~ ., stackloss, kernel = "FBm")  # cApS dOn't MatTeR
kernL(stack.loss ~ ., stackloss,
       kernel = c("linear", "se", "poly3"))  # different kernels

# Sometimes the print output is too long, can use str() options here
print(mod, strict.width = "cut", width = 30)




