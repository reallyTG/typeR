library(fmriqa)


### Name: run_fmriqa
### Title: Run fMRI quality assurance procedure on a NIfTI data file
### Aliases: run_fmriqa

### ** Examples

fname <- system.file("extdata", "qa_data.nii.gz", package = "fmriqa")
res <- run_fmriqa(data_file = fname, gen_png = FALSE, gen_res_csv = FALSE, tr = 3)




