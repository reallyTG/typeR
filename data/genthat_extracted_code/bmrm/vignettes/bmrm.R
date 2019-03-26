## ---- echo=TRUE, results='hide'------------------------------------------
    library(bmrm)
    x <- cbind(intercept=100,data.matrix(iris[c("Sepal.Length","Sepal.Width","Petal.Length","Petal.Width")]))
    w <- nrbm(softMarginVectorLoss(x,iris$Species))
    table(target=iris$Species,prediction=predict(w,x))

