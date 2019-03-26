library(RSEIS)


### Name: ReadSet.Instr
### Title: Read Instrument Response file
### Aliases: ReadSet.Instr
### Keywords: misc

### ** Examples

###  in this case a file has already been read in:
CMG <- c(
      "ZEROS 2",
      "0.0000E+00 0.0000E+00",
      "0.0000E+00 0.0000E+00",
      "POLES 3",
      "-0.1480E+00 0.1480E+00",
      "-0.1480E+00 -0.1480E+00",
      "-50.0 0.0",
      "CONSTANT 1.0",
      "SENSE 800")

ReadSet.Instr(CMG)

## Not run: 
##D RL28  <-  ReadSet.Instr('/pathto/Equipment/Sensors/L28.inst.response')
## End(Not run)





