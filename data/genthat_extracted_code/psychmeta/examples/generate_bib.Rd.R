library(psychmeta)


### Name: generate_bib
### Title: Generate a list of references included in meta-analyses
### Aliases: generate_bib

### ** Examples

## Not run: 
##D ## Run a meta-analysis using ma_r() and include a citekey argument to provide
##D ## citation information for each source contributing to the meta-analyses.
##D ma_obj <- ma_r(ma_method = "ic", rxyi = rxyi, n = n, rxx = rxxi, ryy = ryyi,
##D                construct_x = x_name, construct_y = y_name, sample_id = sample_id,
##D                moderators = moderator, citekey = citekey, data = data_r_meas_multi)
##D 
##D ## Next, use generate_bib() to generate the bibliography for the retained studies.
##D ## The bib argument is the BibTeX or BibLaTeX .bib file containing the full
##D ## reference information for each of the citekeys included in the meta-analysis database.
##D generate_bib(ma_obj, bib = system.file("templates/sample_bibliography.bib", package="psychmeta"),
##D              file = "sample bibliography", output_dir = tempdir(), output_format = "word")
## End(Not run)



