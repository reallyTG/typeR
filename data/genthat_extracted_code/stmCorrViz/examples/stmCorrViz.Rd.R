library(stmCorrViz)


### Name: stmCorrViz
### Title: Generate STM Correlation Tree
### Aliases: stmCorrViz

### ** Examples

data(immigration_perceptions)

stmCorrViz(immigration_perceptions$model, "corrviz.html", 
  documents_raw=immigration_perceptions$raw_documents, 
  documents_matrix=immigration_perceptions$documents_matrix)



