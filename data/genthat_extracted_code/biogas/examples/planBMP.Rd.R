library(biogas)


### Name: planBMP
### Title: Claculate Inoculum and Substrate Mass for BMP Experiments
### Aliases: planBMP
### Keywords: manip

### ** Examples


  # Bottles are 500 mL, substrate is wastewater sludge.
  # Assume we want no more than 250 mL reacting volume (~250 g)
  # First try setting ISR and total mass.
  # VS concentrations: 0.02 g/g in inoculum, 0.07 g/g for substrate, ISR = 2.
  planBMP(vs.inoc = 0.02, vs.sub = 0.07, isr = 2, m.tot = 250)
  # Get 31 g substrate, 220 g inoculum.
  
  # After setup, we can check final values.
  planBMP(vs.inoc = 0.018, vs.sub = 0.072, m.sub = 32, m.inoc = 218)
  # We didn't quite meet our target in this case--next time use more inoculum to be sure
  
  # We can alternatively specify substrate VS mass
  planBMP(vs.inoc = 0.02, vs.sub = 0.07, isr = 2, m.vs.sub = 2)
  
  # Some options
  planBMP(vs.inoc = 0.02, vs.sub = 0.07, isr = 2, m.vs.sub = 2, nice = FALSE)
  # Perhaps we want to use three different ISRs
  planBMP(vs.inoc = 0.02, vs.sub = 0.07, isr = 2:4, m.vs.sub = 2, nice = FALSE)



