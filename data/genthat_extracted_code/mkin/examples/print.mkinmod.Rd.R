library(mkin)


### Name: print.mkinmod
### Title: Print mkinmod objects
### Aliases: print.mkinmod

### ** Examples

  m_synth_SFO_lin <- mkinmod(parent = list(type = "SFO", to = "M1"),
                             M1 = list(type = "SFO", to = "M2"),
                             M2 = list(type = "SFO"), use_of_ff = "max")
    
  print(m_synth_SFO_lin)



