library(PCSinR)


### Name: PCS_run_from_interconnections
### Title: Simulate the run of a PCS model based on only the
###   interconnection matrix
### Aliases: PCS_run_from_interconnections

### ** Examples


# Build interconnection matrix
interconnections <- matrix(
  c( 0.0000,  0.1015,  0.0470,  0.0126,  0.0034,  0.0000,  0.0000,
    0.1015,  0.0000,  0.0000,  0.0000,  0.0000,  0.0100, -0.0100,
    0.0470,  0.0000,  0.0000,  0.0000,  0.0000,  0.0100, -0.0100,
    0.0126,  0.0000,  0.0000,  0.0000,  0.0000,  0.0100, -0.0100,
    0.0034,  0.0000,  0.0000,  0.0000,  0.0000, -0.0100,  0.0100,
    0.0000,  0.0100,  0.0100,  0.0100, -0.0100,  0.0000, -0.2000,
    0.0000, -0.0100, -0.0100, -0.0100,  0.0100, -0.2000,  0.0000 ),
  nrow=7
  )

# Run model
result <- PCS_run_from_interconnections(interconnections)

# Examine iterations required for convergence
result$convergence

# Examine final model state
result$iterations[nrow(result$iterations),]




