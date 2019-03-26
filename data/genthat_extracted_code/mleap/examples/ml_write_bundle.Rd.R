library(mleap)


### Name: ml_write_bundle
### Title: Export a Spark pipeline for serving
### Aliases: ml_write_bundle

### ** Examples

## Not run: 
##D library(sparklyr)
##D sc <- spark_connect(master = "local")
##D mtcars_tbl <- sdf_copy_to(sc, mtcars, overwrite = TRUE)
##D pipeline <- ml_pipeline(sc) %>%
##D   ft_binarizer("hp", "big_hp", threshold = 100) %>%
##D   ft_vector_assembler(c("big_hp", "wt", "qsec"), "features") %>%
##D   ml_gbt_regressor(label_col = "mpg")
##D pipeline_model <- ml_fit(pipeline, mtcars_tbl)
##D model_path <- file.path(tempdir(), "mtcars_model.zip")
##D ml_write_bundle(pipeline_model, 
##D                 ml_transform(pipeline_model, mtcars_tbl),
##D                 model_path,
##D                 overwrite = TRUE)
## End(Not run)




