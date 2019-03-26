## ----setup, include=FALSE------------------------------------------------
library(Rcpp)
library(RcppNumerical)
knitr::opts_chunk$set(message = FALSE, warning = FALSE,
                      comment = "#", collapse = TRUE)

## ----include=FALSE-------------------------------------------------------
includes = '
#include <RcppNumerical.h>
using namespace Numer;

// P(0.3 < X < 0.8), X ~ Beta(a, b)
class BetaPDF: public Func
{
private:
    double a;
    double b;
public:
    BetaPDF(double a_, double b_) : a(a_), b(b_) {}

    double operator()(const double& x) const
    {
        return R::dbeta(x, a, b, 0);
    }
};
'
code = '
Rcpp::List integrate_test()
{
    const double a = 3, b = 10;
    const double lower = 0.3, upper = 0.8;
    const double true_val = R::pbeta(upper, a, b, 1, 0) -
                            R::pbeta(lower, a, b, 1, 0);

    BetaPDF f(a, b);
    double err_est;
    int err_code;
    const double res = integrate(f, lower, upper, err_est, err_code);
    return Rcpp::List::create(
        Rcpp::Named("true") = true_val,
        Rcpp::Named("approximate") = res,
        Rcpp::Named("error_estimate") = err_est,
        Rcpp::Named("error_code") = err_code
    );
}
'
cppFunction(code, depends = c("RcppEigen", "RcppNumerical"), includes = includes,
            showOutput = FALSE, verbose = FALSE)

## ------------------------------------------------------------------------
integrate_test()

## ----include=FALSE-------------------------------------------------------
includes = '
#include <RcppNumerical.h>
using namespace Numer;

// P(a1 < X1 < b1, a2 < X2 < b2), (X1, X2) ~ N([0], [1   rho])
//                                            ([0], [rho   1])
class BiNormal: public MFunc
{
private:
    const double rho;
    double const1;  // 2 * (1 - rho^2)
    double const2;  // 1 / (2 * PI) / sqrt(1 - rho^2)
public:
    BiNormal(const double& rho_) : rho(rho_)
    {
        const1 = 2.0 * (1.0 - rho * rho);
        const2 = 1.0 / (2 * M_PI) / std::sqrt(1.0 - rho * rho);
    }

    // PDF of bivariate normal
    double operator()(Constvec& x)
    {
        double z = x[0] * x[0] - 2 * rho * x[0] * x[1] + x[1] * x[1];
        return const2 * std::exp(-z / const1);
    }
};
'
code = '
Rcpp::List integrate_test2()
{
    BiNormal f(0.5);  // rho = 0.5
    Eigen::VectorXd lower(2);
    lower << -1, -1;
    Eigen::VectorXd upper(2);
    upper << 1, 1;
    double err_est;
    int err_code;
    const double res = integrate(f, lower, upper, err_est, err_code);
    return Rcpp::List::create(
        Rcpp::Named("approximate") = res,
        Rcpp::Named("error_estimate") = err_est,
        Rcpp::Named("error_code") = err_code
    );
}
'
cppFunction(code, depends = c("RcppEigen", "RcppNumerical"), includes = includes,
            showOutput = FALSE, verbose = FALSE)

## ------------------------------------------------------------------------
library(mvtnorm)
trueval = pmvnorm(c(-1, -1), c(1, 1), sigma = matrix(c(1, 0.5, 0.5, 1), 2))
integrate_test2()
as.numeric(trueval) - integrate_test2()$approximate

## ----include=FALSE-------------------------------------------------------
includes = '
#include <RcppNumerical.h>

using namespace Numer;

// f = 100 * (x2 - x1^2)^2 + (1 - x1)^2
// True minimum: x1 = x2 = 1
class Rosenbrock: public MFuncGrad
{
public:
    double f_grad(Constvec& x, Refvec grad)
    {
        double t1 = x[1] - x[0] * x[0];
        double t2 = 1 - x[0];
        grad[0] = -400 * x[0] * t1 - 2 * t2;
        grad[1] = 200 * t1;
        return 100 * t1 * t1 + t2 * t2;
    }
};
'
code = '
Rcpp::List optim_test()
{
    Eigen::VectorXd x(2);
    x[0] = -1.2;
    x[1] = 1;
    double fopt;
    Rosenbrock f;
    int res = optim_lbfgs(f, x, fopt);
    return Rcpp::List::create(
        Rcpp::Named("xopt") = x,
        Rcpp::Named("fopt") = fopt,
        Rcpp::Named("status") = res
    );
}
'
cppFunction(code, depends = c("RcppEigen", "RcppNumerical"), includes = includes,
            showOutput = FALSE, verbose = FALSE)

## ------------------------------------------------------------------------
optim_test()

## ----include=FALSE-------------------------------------------------------
includes = "
#include <RcppNumerical.h>

using namespace Numer;

typedef Eigen::Map<Eigen::MatrixXd> MapMat;
typedef Eigen::Map<Eigen::VectorXd> MapVec;

class LogisticReg: public MFuncGrad
{
private:
    const MapMat X;
    const MapVec Y;
public:
    LogisticReg(const MapMat x_, const MapVec y_) : X(x_), Y(y_) {}

    double f_grad(Constvec& beta, Refvec grad)
    {
        // Negative log likelihood
        //   sum(log(1 + exp(X * beta))) - y' * X * beta

        Eigen::VectorXd xbeta = X * beta;
        const double yxbeta = Y.dot(xbeta);
        // X * beta => exp(X * beta)
        xbeta = xbeta.array().exp();
        const double f = (xbeta.array() + 1.0).log().sum() - yxbeta;

        // Gradient
        //   X' * (p - y), p = exp(X * beta) / (1 + exp(X * beta))

        // exp(X * beta) => p
        xbeta.array() /= (xbeta.array() + 1.0);
        grad.noalias() = X.transpose() * (xbeta - Y);

        return f;
    }
};
"
code = '
Rcpp::NumericVector logistic_reg(Rcpp::NumericMatrix x, Rcpp::NumericVector y)
{
    const MapMat xx = Rcpp::as<MapMat>(x);
    const MapVec yy = Rcpp::as<MapVec>(y);
    // Negative log likelihood
    LogisticReg nll(xx, yy);
    // Initial guess
    Eigen::VectorXd beta(xx.cols());
    beta.setZero();

    double fopt;
    int status = optim_lbfgs(nll, beta, fopt);
    if(status < 0)
        Rcpp::stop("fail to converge");

    return Rcpp::wrap(beta);
}
'
cppFunction(code, depends = c("RcppEigen", "RcppNumerical"), includes = includes,
            showOutput = FALSE, verbose = FALSE)

## ------------------------------------------------------------------------
set.seed(123)
n = 5000
p = 100
x = matrix(rnorm(n * p), n)
beta = runif(p)
xb = c(x %*% beta)
p = exp(xb) / (1 + exp(xb))
y = rbinom(n, 1, p)

system.time(res1 <- glm.fit(x, y, family = binomial())$coefficients)
system.time(res2 <- logistic_reg(x, y))
max(abs(res1 - res2))

## ------------------------------------------------------------------------
system.time(res3 <- fastLR(x, y)$coefficients)
max(abs(res1 - res3))

