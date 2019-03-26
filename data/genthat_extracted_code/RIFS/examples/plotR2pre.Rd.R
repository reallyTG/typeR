library(RIFS)


### Name: plotR2pre
### Title: Plot a prefractal set in R^2
### Aliases: plotR2pre

### ** Examples

# Example 1. Sierpinski triangle, 1st order, p=const, mu=var
for (m in seq(-4,0)) {
  plotR2pre(preRIFS(M=2^rnorm(n=3, mean=m, sd=-m/4)),
            s="Prefractal points for 1st order 3-gon")
  Sys.sleep(0.5)
}

# Example 2. Uniform distribution, 1st order, p=const, mu=var
for (m in seq(-4,0)) {
  plotR2pre(preRIFS(Z=R2ngon(4,1), 
                    M=2^rnorm(n=4, mean=m, sd=-m/4)), 
            s="Prefractal points for 1st order 4-gon")
  Sys.sleep(0.5)
}

# Example 3. Sierpinski triangle, 2nd order, p=const, mu=var
for (m in seq(-3,1)) {
  plotR2pre(preRIFS(Z=R2ngon(3,2), 
                    M=2^rnorm(n=6, mean=m, sd=-(m-1)/4)), 
            s="Prefractal points for 2nd order 3-gon")
  Sys.sleep(0.5)
}

# Example 4. Sierpinski square, 2nd order, p=const, mu=var
for (m in seq(-3,1)) {
  plotR2pre(preRIFS(Z=R2ngon(4,2), 
                    M=2^rnorm(n=8, mean=m, sd=-(m-1)/4)), 
            s="Prefractal points for 2nd order 4-gon")
  Sys.sleep(0.5)
}



