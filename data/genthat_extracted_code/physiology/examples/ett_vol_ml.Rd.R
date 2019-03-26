library(physiology)


### Name: ett_vol_ml
### Title: Estimate volume inside an endotracheal tube
### Aliases: ett_vol_ml

### ** Examples

ett_vol_ml(2:8)
plot(2:8, ett_vol_ml(2:8))
lines(2:8, ett_vol_ml(2:8),
  xlab = "ETT internal diameter, mm",
  ylab = "ETT internal volume, mm^3")
(vols_cm3 <- ett_vol_ml(seq(2, 6, 0.5)) / 1000)

# Ages through to ETT internal volume
ett_vol_ml(ett_size_by_age(1:10))




