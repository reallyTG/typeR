## ----inlineex1-----------------------------------------------------------
fx <- Rcpp::cppFunction("
int sum_gsl_vector_int(RcppGSL::vector<int> vec) {
    int res = std::accumulate(vec.begin(),
                              vec.end(), 0);
    return res;
}", depends="RcppGSL")
sum_gsl_vector_int(1:10)

## ----inlinexex2----------------------------------------------------------
Rcpp::cppFunction("
double gsl_vector_sum_2(Rcpp::List data) {
    RcppGSL::vector<double> x = data[\"x\"];
    RcppGSL::vector<int> y = data[\"y\"];
    double res = 0.0;
    for (size_t i=0; i< x->size; i++) {
        res += x[i] * y[i];
    }
    return res;
}", depends= "RcppGSL")
data <- list( x = seq(0,1,length=10), y = 1:10 )
gsl_vector_sum_2(data)

## ----exskel, eval=FALSE--------------------------------------------------
#  package.skeleton("mypackage", foo)

## ----exnorm, eval=FALSE--------------------------------------------------
#  sourceCpp("gslNorm.cpp")

