library(lsa)


### Name: triples
### Title: Bind Triples to a Textmatrix
### Aliases: getTriple setTriple delTriple getSubjectId
### Keywords: array

### ** Examples


    x = matrix(2,2,3) # we fake a document term matrix
    rownames(x) = c("dog","mouse") # fake term names
    colnames(x) = c("doc1","doc2","doc3") # fake doc titles
    class(x) = "textmatrix" # usually done by textmatrix()
    environment(x) = new.env() # usually done by textmatrix()
    
    setTriple(x, "doc1", "has_category", "15")
    setTriple(x, "doc2", "has_category", "7")
    setTriple(x, "doc1", "has_grade", "5")
    setTriple(x, "doc1", "has_category", "11")
    
    getTriple(x, "doc1")
    getTriple(x, "doc1")[[2]]
    getTriple(x, "doc1", "has_category") # -> [1] "15" "11"
    
    delTriple(x, "doc1", "has_category", "15")
    getTriple(x, "doc1", "has_category") # -> [1] "11"
    



