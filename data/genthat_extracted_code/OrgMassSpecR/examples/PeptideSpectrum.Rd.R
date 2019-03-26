library(OrgMassSpecR)


### Name: PeptideSpectrum
### Title: Plot Annotated Peptide Fragmentation Mass Spectrum
### Aliases: PeptideSpectrum

### ** Examples

## plot spectrum of peptide NIDALSGMEGR
t <- FragmentPeptide("NIDALSGMEGR")   # generate theoretical fragment ions
PeptideSpectrum(example.spectrum.peptide, t, label = "CID", xlim = c(100, 1200))
mtext("Peptide fragmentation mass spectrum", line = 1)



