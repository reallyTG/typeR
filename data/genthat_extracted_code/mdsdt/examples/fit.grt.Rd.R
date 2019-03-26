library(mdsdt)


### Name: fit.grt
### Title: Fit full Gaussian GRT model
### Aliases: fit.grt

### ** Examples

# Fit unconstrained model
data(thomas01b);
grt_obj <- fit.grt(thomas01b);

# Use standard S3 generics to examine
print(grt_obj);
summary(grt_obj);
plot(grt_obj);

# Fit model with assumption of perceptual separability on both dimensions
grt_obj_PS <- fit.grt(thomas01b, PS_x = TRUE, PS_y = TRUE);
summary(grt_obj_PS);
plot(grt_obj_PS);

# Compare models
GOF(grt_obj, teststat = 'AIC');
GOF(grt_obj_PS, teststat = 'AIC');



