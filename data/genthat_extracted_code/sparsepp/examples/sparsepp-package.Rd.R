library(sparsepp)


### Name: sparsepp-package
### Title: sparsepp
### Aliases: sparsepp sparsepp-package

### ** Examples

## Not run: 
##D library(Rcpp)
##D code = "
##D // [[Rcpp::plugins(cpp11)]]
##D #include <Rcpp.h>
##D using namespace std;
##D using namespace Rcpp;
##D // drop-in replacement for unordered_map
##D //#include <unordered_map>
##D #include <sparsepp/spp.h>
##D //[[Rcpp::depends(sparsepp)]]
##D using spp::sparse_hash_map;
##D // @export
##D // [[Rcpp::export]]
##D IntegerVector word_count(CharacterVector v) {
##D   //unordered_map<string, int> smap;
##D   sparse_hash_map<string, int> smap;
##D   for(auto x: v) {
##D     smap[as<string>(x)] ++;
##D   }
##D   IntegerVector res(smap.size());
##D   int i = 0;
##D   for(auto s:smap) {
##D     res[i]=s.second;
##D     i++;
##D   }
##D   return(res);
##D }"
##D f = tempfile(, fileext = ".cpp")
##D writeLines(code, f)
##D sourceCpp(f)
##D unlink(f)
##D word_count(sample(letters, 100, T))
## End(Not run)



