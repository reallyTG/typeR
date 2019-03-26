library(freesurfer)


### Name: aparcstats2table
### Title: Parcellation Stats to Table
### Aliases: aparcstats2table

### ** Examples

if (have_fs()) {
   fs_subj_dir()
   outfile = aparcstats2table(subjects = "bert",
                    hemi = "lh",
                    meas = "thickness")
}



