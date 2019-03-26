library(cultevo)


### Name: page.test
### Title: Page test for monotonicity of ranks.
### Aliases: page.test page.L page.compute.exact

### ** Examples

# exact p value computation for N=4, k=4
page.test(t(replicate(4, sample(4))))

# exact p value computation for N=4, k=10
page.test(t(replicate(4, sample(10))))

# approximate p value computation for N=4, k=23
result <- page.test(t(replicate(4, sample(23))), verbose = FALSE)

print(result)

# raw calculation of the significance levels
page.compute.exact(6, 4, 322)



