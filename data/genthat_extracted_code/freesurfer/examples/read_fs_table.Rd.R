library(freesurfer)


### Name: read_fs_table
### Title: Read Freesurfer Table Output
### Aliases: read_fs_table

### ** Examples

if (have_fs()) {
   outfile = aparcstats2table(subjects = "bert",
                    hemi = "lh",
                    meas = "thickness")
   df = read_fs_table(outfile)
   seg_outfile = asegstats2table(subjects = "bert", meas = "mean")
   df_seg = read_fs_table(seg_outfile)
}
## Not run: 
##D ### using the pipe
##D df_seg = asegstats2table(subjects = "bert", meas = "mean") %>% 
##D             read_fs_table
## End(Not run)



