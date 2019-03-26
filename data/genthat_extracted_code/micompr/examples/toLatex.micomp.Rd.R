library(micompr)


### Name: toLatex.micomp
### Title: Convert 'micomp' object to 'LaTeX' table
### Aliases: toLatex.micomp

### ** Examples


# Create a micomp object, use provided dataset, three first outputs, plus
# a fourth concatenated output
mic <- micomp(4, 0.8,
              list(list(name = "NLOKvsJEXOK", grpout = pphpc_ok),
                   list(name = "NLOKvsJEXNOSHUFF", grpout = pphpc_noshuff),
                   list(name = "NLOKvsJEXDIFF", grpout = pphpc_diff)),
              concat = TRUE)

# Print latex table source to screen
toLatex(mic)




