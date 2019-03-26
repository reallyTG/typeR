library(psychmeta)


### Name: metabulate
### Title: Write a summary table of meta-analytic results
### Aliases: metabulate

### ** Examples

## Not run: 
##D ## Create a results table for meta-analysis of correlations and output to Word:
##D ma_r_obj <- ma_r(ma_method = "ic", rxyi = rxyi, n = n, rxx = rxxi, ryy = ryyi,
##D                  construct_x = x_name, construct_y = y_name,
##D                  moderators = moderator, data = data_r_meas_multi)
##D metabulate(ma_obj = ma_r_obj, file = "meta tables correlations",
##D            output_format = "word", output_dir = tempdir())
##D 
##D ## Output to PDF:
##D metabulate(ma_obj = ma_r_obj, file = "meta tables correlations",
##D            output_format = "pdf", output_dir = tempdir())
##D 
##D ## Output to ODT (LibreOffice):
##D metabulate(ma_obj = ma_r_obj, file = "meta tables correlations",
##D            output_format = "odt", output_dir = tempdir())
##D 
##D 
##D ## To produce Markdown tables to include inline in an RMarkdown report,
##D ## leave file == NULL and output_format to anything but "text":
##D ma_table <- metabulate(ma_obj = ma_r_obj, file = NULL, output_format = "rmd")
##D 
##D ## Use the metabulate_rmd_helper() function to ensure all symbols render properly.
##D Insert the following code as 'as-is' output:
##D metabulate_rmd_helper()
##D 
##D ## Then, add the formatted table to your document using your preferred table
##D ## formatting functions:
##D 
##D #### Using just the 'knitr' package, include the following as 'as-is' output:
##D knitr::kable(ma_table[[1]], caption = attr(ma_table[[1]], "caption"))
##D cat("\n", attr(ma_table[[1]], "footnote"))
##D 
##D #### Using 'knitr' plus the 'kableExtra' package:
##D knitr::kable(ma_table[[1]], "latex", booktabs = TRUE,
##D                   caption = attr(ma_table[[1]], "caption")) %>%
##D        kableExtra::kable_styling(latex_options = c("striped", "hold_position")) %>%
##D        kableExtra::footnote(general = attr(ma_table[[1]], "footnote")
##D 
##D # !!! Note: On Windows, R currently can only handle Unicode characters if kables
##D # are printed at top-level (e.g., not in an if() statement, in a for() loop,
##D # or in lapply() or map() ). To correctly print Unicode metabulate tables, call
##D # kable() as a top-level function (as above).
##D 
##D 
##D ## Create output table for meta-analysis of d values:
##D ma_d_obj <- ma_d(ma_method = "ic", d = d, n1 = n1, n2 = n2, ryy = ryyi,
##D                  construct_y = construct, data = data_d_meas_multi)
##D ma_d_obj <- ma_d_ad(ma_obj = ma_d_obj, correct_rr_g = FALSE, correct_rr_y = FALSE)
##D metabulate(ma_obj = ma_d_obj, file = "meta tables d values", output_dir = tempdir())
##D 
##D ## Create output table for meta-analysis of generic effect sizes:
##D dat <- data.frame(es = data_r_meas_multi$rxyi,
##D                   n = data_r_meas_multi$n,
##D                   var_e = (1 - data_r_meas_multi$rxyi^2)^2 / (data_r_meas_multi$n - 1))
##D ma_obj <- ma_generic(es = es, n = n, var_e = var_e, data = dat)
##D metabulate(ma_obj = ma_obj, file = "meta tables generic es", output_dir = tempdir())
## End(Not run)



