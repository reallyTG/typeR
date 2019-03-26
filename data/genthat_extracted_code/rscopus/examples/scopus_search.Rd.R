library(rscopus)


### Name: scopus_search
### Title: SCOPUS Search
### Aliases: scopus_search sciencedirect_search scidir_search

### ** Examples

if (have_api_key()) {
res = scopus_search(query = "all(gene)", max_count = 20,
count = 10)
df = gen_entries_to_df(res$entries)
head(df$df)
sci_res = sciencedirect_search(query = "heart+attack AND text(liver)",
max_count = 30, count = 25)
sci_df = gen_entries_to_df(sci_res$entries)

nt = sciencedirect_search(query = "title(neurotoxin)", max_count = 20,
count = 10)
nt_df = gen_entries_to_df(nt$entries)
nt_df = nt_df$df
}



