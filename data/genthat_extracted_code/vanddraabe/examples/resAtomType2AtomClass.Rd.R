library(vanddraabe)


### Name: resAtomType2AtomClass
### Title: Convert Residue-AtomType to AtomType Class
### Aliases: resAtomType2AtomClass

### ** Examples

  resAtomType2AtomClass(resAT="LYS NZ")
  # [1] "Nitrogen (+)"
  resAtomType2AtomClass(resAT="GLU N")
  # [1] "Nitrogen"
  resAtomType2AtomClass(resAT="VAL O")
  # [1] "Oxygen"
  resAtomType2AtomClass(resAT="ASP OD2")
  # [1] "Oxygen (-)"
  resAtomType2AtomClass(resAT="GLN CA")
  # [1] "Carbon"
  resAtomType2AtomClass(resAT="CYS SG")
  # [1] "Sulfur"




