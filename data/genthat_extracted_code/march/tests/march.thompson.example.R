# Compute a first-order homogeneous Markov Chain for the pewee data.
MC1 <- march.mc.construct(pewee,1)
# Display the transition matrix
print(MC1@RC)
# Compute the half-length 95% confidence interval for each row of the transition matrix.
march.thompson(MC1,alpha=0.05)

# Compute a third-order MTD model for the pewee data.
MTD3 <- march.mtd.construct(pewee,3)
# Display the model
print(MTD3)
# Compute the half-length 95% confidence interval for the vector of lags
# and for each row of the transition matrix.
march.thompson(MTD3,alpha=0.05)
