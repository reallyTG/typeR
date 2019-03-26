library(freesurfer)


### Name: aparcs_to_bg
### Title: Convert Freesurfer aparcs Table to brainGraph
### Aliases: aparcs_to_bg

### ** Examples

if (have_fs()) {
   fs_subj_dir() 
   df = aparcs_to_bg(subjects = "bert", measure = "thickness")
   print(head(df))
}



