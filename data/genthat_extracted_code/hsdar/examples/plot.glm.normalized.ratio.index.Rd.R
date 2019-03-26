library(hsdar)


### Name: plot.Nri
### Title: Plot function for (g)lm.nri and cor.test.nri
### Aliases: plot.Nri plot,Nri-method plot,Nri,ANY-method
### Keywords: aplot

### ** Examples

## Not run: 
##D data(spectral_data)
##D 
##D ## Calculate all possible combinations for WorldView-2-8
##D spec_WV <- spectralResampling(spectral_data, "WorldView2-8",
##D                               response_function = FALSE)
##D nri_WV <- nri(spec_WV, recursive = TRUE)
##D 
##D ## Fit generalised linear models between NRI-values and chlorophyll
##D glmnri <- glm.nri(nri_WV ~ chlorophyll, preddata = spec_WV)
##D 
##D ## Plot p-values
##D plot(glmnri, range = c(0, 0.05))
##D ## Plot t-values
##D plot(glmnri, coefficient = "t.value")
##D ## Plot only t-values where p-values < 0.001
##D plot(glmnri, coefficient = "t.value", 
##D      constraint = "p.value < 0.001")
##D 
##D ## Fit linear models between NRI-values and chlorophyll
##D lmnri <- lm.nri(nri_WV ~ chlorophyll, preddata = spec_WV)
##D 
##D ## Plot r.squared
##D plot(lmnri)
##D 
##D ## Example for EnMAP (Attention: Calculation time may be long!)
##D spec_EM <- spectralResampling(spectral_data, "EnMAP", 
##D                               response_function = FALSE)
##D mask(spec_EM) <- c(300, 550, 800, 2500)
##D nri_EM <- nri(spec_EM, recursive = TRUE)
##D glmnri <- glm.nri(nri_EM ~ chlorophyll, preddata = spec_EM)
##D 
##D ## Plot T values in lower and p-values in upper diagonal
##D ## of the plot
##D ## Enlarge margins for legends
##D par(mar = c(5.1, 4.1, 4.1, 5))
##D plot(glmnri, coefficient = "t.value", legend = "outer")
##D plot(glmnri, coefficient = "p.value", uppertriang = TRUE, zlog = TRUE)
##D lines(c(400,1705),c(400,1705))
## End(Not run)



