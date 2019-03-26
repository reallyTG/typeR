library(eseis)


### Name: model_turbulence
### Title: Model the seismic spectrum due to hydraulic turbulence
### Aliases: model_turbulence
### Keywords: eseis

### ** Examples


## model the turbulence-related power spectrum
P <- model_turbulence(d_s = 0.03, # 3 cm mean grain-size
                      s_s = 1.35, # 1.35 log standard deviation
                      r_s = 2650, # 2.65 g/cm^3 sediment density
                      h_w = 0.8, # 80 cm water level
                      w_w = 40, # 40 m river width
                      a_w = 0.0075, # 0.0075 rad river inclination
                      f = c(1, 200), # 1-200 Hz frequency range
                      r_0 = 10, # 10 m distance to the river
                      f_0 = 1, # 1 Hz Null frequency 
                      q_0 = 10, # 10 quality factor at f = 1 Hz
                      v_0 = 2175, # 2175 m/s phase velocity
                      p_0 = 0.48, # 0.48 power law variation coefficient
                      n_0 = c(0.6, 0.8), # Greens function estimates
                      res = 1000) # 1000 values build the output resolution

## plot the power spectrum
plot_spectrum(data = P)
              



