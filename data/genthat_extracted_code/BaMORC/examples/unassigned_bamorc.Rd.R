library(BaMORC)


### Name: unassigned_bamorc
### Title: Calculates the referencing correction value for unassigned
###   protein NMR peaklists. 'unassigned_bamorc()' will analyze unassigned
###   protein NMR spectra, first groups the peaklist via SSC, then
###   estimates the secondary structure via JPred, finally using BaMORC
###   core function to calculate the reference correction value.
### Aliases: unassigned_bamorc

### ** Examples

sequence = "RPAFCLEPPYAGPGKARIIRYFYNAAAGAAQAFVYGGVRAKRNNFASAADALAACAAA"
peakList_file_loc = system.file("extdata", "bpti_HNcoCACB.txt", package = "BaMORC")
## Not run: 
##D unassigned_bamorc(peakList_file_loc, sequence, secondary_structure=NULL,
##D from=-5, to=5, ssc="moseleybioinformaticslab/ssc",
##D para="--plformat=sparky --stype=HNcoCACB --dims=H,N,CA/CB --rdims=H,N")
## End(Not run)
# Expected result should be around (due to randomness): 0.0007890328



