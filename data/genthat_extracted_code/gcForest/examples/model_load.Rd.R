library(gcForest)


### Name: model_load
### Title: gcForest Model Persistence Function
### Aliases: model_load

### ** Examples


have_numpy <- reticulate::py_module_available("numpy")
have_sklearn <- reticulate::py_module_available("sklearn")

if(have_numpy && have_sklearn){
    library(gcForest)
    req_py()

    sk <- NULL

    .onLoad <- function(libname, pkgname) {
        sk <<- reticulate::import("sklearn", delay_load = TRUE)
      }
    sk <<- reticulate::import("sklearn", delay_load = TRUE)
    train_test_split <- sk$model_selection$train_test_split

    data <- sk$datasets$load_iris
    iris <- data()
    X = iris$data
    y = iris$target
    data_split = train_test_split(X, y, test_size=0.33)

    X_tr <- data_split[[1]]
    X_te <- data_split[[2]]
    y_tr <- data_split[[3]]
    y_te <- data_split[[4]]

    gcforest_m <- gcforest(shape_1X=4L, window=2L, tolerance=0.0)
    gcforest_m$fit(X_tr, y_tr)
    gcf_model <- model_save(gcforest_m,'gcforest_model.model')

    gcf <- model_load('gcforest_model.model')
    gcf$predict(X_te)

}else{
    print('You should have the Python testing environment!')
}






