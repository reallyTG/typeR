library(gcForest)


### Name: gcdata
### Title: R Data Transform to Python Data
### Aliases: gcdata

### ** Examples


have_numpy <- reticulate::py_module_available("numpy")
have_sklearn <- reticulate::py_module_available("sklearn")

if(have_numpy && have_sklearn){

    library(gcForest)
    req_py()

    r_dat <- data.frame('x1'=c(1L,2L,3L),'x2'=c(2L,3L,4L))
    py_dat <- gcdata(r_dat)
    class(py_dat)

    r_vec <- c('a','b','c')
    py_vec <- gcdata(r_vec)
    class(py_vec)
}else{
    print('You should have the Python testing environment!')
}





