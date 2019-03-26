library(kitagawa)


### Name: omega_constants
### Title: Calculate any constants that depend on angular frequency omega
### Aliases: omega_constants omega_constants.default

### ** Examples

# alpha
omega_constants() # default is alpha, but will give warnings about S., T., Rs.
omega_constants(T.=1,S.=1,Rs.=1)  # 0, no warnings
omega_constants(1:10)  # sequence, with warnings about S., T., Rs.
omega_constants(1:10,T.=1,S.=1,Rs.=1) # sequence, no warnings
# diffusivity time
omega_constants(c.type="diffusivity_time", D.=1)  # 0, no warnings
omega_constants(c.type="diff", D.=1)  # 0, no warnings (arg matching)
omega_constants(c.type="diff")  # 0, warnings about S., T. because no D.
omega_constants(c.type="diff", S.=1)  # 0, warnings about T. because no D. or S.



