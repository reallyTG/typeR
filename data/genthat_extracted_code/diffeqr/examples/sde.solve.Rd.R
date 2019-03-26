library(diffeqr)


### Name: sde.solve
### Title: Solve Stochastic Differential Equations (SDE)
### Aliases: sde.solve

### ** Examples


## No test: 
 ## diffeq_setup() is time-consuming and requires Julia+DifferentialEquations.jl

diffeqr::diffeq_setup()

# Scalar SDEs

f <- function(u,p,t) {
  return(1.01*u)
}
g <- function(u,p,t) {
  return(0.87*u)
}
u0 = 1/2
tspan <- list(0.0,1.0)
sol = diffeqr::sde.solve(f,g,u0,tspan)
#plotly::plot_ly(udf, x = sol$t, y = sol$u, type = 'scatter', mode = 'lines')

# Diagonal Noise SDEs

f <- JuliaCall::julia_eval("
function f(du,u,p,t)
  du[1] = 10.0*(u[2]-u[1])
  du[2] = u[1]*(28.0-u[3]) - u[2]
  du[3] = u[1]*u[2] - (8/3)*u[3]
end")

g <- JuliaCall::julia_eval("
function g(du,u,p,t)
  du[1] = 0.3*u[1]
  du[2] = 0.3*u[2]
  du[3] = 0.3*u[3]
end")
tspan <- list(0.0,100.0)
sol = diffeqr::sde.solve('f','g',u0,tspan,p=p,saveat=0.05)
udf = as.data.frame(sol$u)
#plotly::plot_ly(udf, x = ~V1, y = ~V2, z = ~V3, type = 'scatter3d', mode = 'lines')

# Non-Diagonal Noise SDEs

f <- JuliaCall::julia_eval("
function f(du,u,p,t)
  du[1] = 10.0*(u[2]-u[1])
  du[2] = u[1]*(28.0-u[3]) - u[2]
  du[3] = u[1]*u[2] - (8/3)*u[3]
end")
g <- JuliaCall::julia_eval("
function g(du,u,p,t)
  du[1,1] = 0.3u[1]
  du[2,1] = 0.6u[1]
  du[3,1] = 0.2u[1]
  du[1,2] = 1.2u[2]
  du[2,2] = 0.2u[2]
  du[3,2] = 0.3u[2]
end")
u0 = c(1.0,0.0,0.0)
tspan <- list(0.0,100.0)
noise.dims = list(3,2)
sol = diffeqr::sde.solve('f','g',u0,tspan,saveat=0.005,noise.dims=noise.dims)
udf = as.data.frame(sol$u)
#plotly::plot_ly(udf, x = ~V1, y = ~V2, z = ~V3, type = 'scatter3d', mode = 'lines')

## End(No test)




