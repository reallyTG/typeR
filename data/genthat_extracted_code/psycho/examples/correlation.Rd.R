library(psycho)


### Name: correlation
### Title: Multiple Correlations.
### Aliases: correlation

### ** Examples

df <- attitude

# Normal correlations
results <- psycho::correlation(df)
print(results)
plot(results)

# Partial correlations with correction
results <- psycho::correlation(df,
  type = "partial",
  method = "spearman",
  adjust = "holm"
)
print(results)
plot(results)



