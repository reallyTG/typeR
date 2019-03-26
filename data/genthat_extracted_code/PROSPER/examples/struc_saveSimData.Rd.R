library(PROSPER)


### Name: struc_saveSimData
### Title: Saving simulation data
### Aliases: struc_saveSimData

### ** Examples

struc_preparation(Rmx=10, n_loci=2, epis=0, dom=c(1,0.3))
dfgenotype$"SB_autumn" <- c(4,23,0,123,53,98,45,3245,234)
dfgenotype$"SB_autumn_end" <- c(0,2,0,123,434,5234,5678,123,2)
#creation of an example object with data of the first year
struc_saveSimData(rep_counter=1, simcycle=1, loci=2, simstruc=c(5, 10), 
                                 start_name="SB_autumn", end_name="SB_autumn_end")
#creating some fictional population stages
dfgenotype$"SB_autumn" <- c(1,1,1,1,0,0,0,0,4)
dfgenotype$"SB_autumn_end" <- c(67,67,67,67,67,67,67,67,67)
#appending rows with the new results to the first results. necessary columns are inserted.
struc_saveSimData( rep_counter=1, simcycle=2,
                     start_name="SB_autumn", end_name="SB_autumn_end",
                      loci=n_loci, simstruc=c(repetitions, duration)) 
sim_result                               
rm(sim_result, dfgenotype, mf, xprobab)                               



