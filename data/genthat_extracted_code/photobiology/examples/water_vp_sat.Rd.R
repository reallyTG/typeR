library(photobiology)


### Name: water_vp_sat
### Title: Water vapour pressure
### Aliases: water_vp_sat water_dp water_vp2mvc water_mvc2vp

### ** Examples

water_vp_sat(20) # C -> Pa
water_vp_sat(-10) # over water!!
water_vp_sat(-10, over.ice = TRUE)
water_vp_sat(20) / 100 # C -> mbar

water_dp(1000) # Pa -> C

water_vp2mvc(1000, 20) # Pa -> g m-3

water_mvc2vp(30, 40) # g m-3 -> Pa

water_dp(water_mvc2vp(10, 30)) # g m-3 -> C




