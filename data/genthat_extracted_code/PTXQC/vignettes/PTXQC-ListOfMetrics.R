## ----setup, include=TRUE, echo=FALSE, results="asis"---------------------
## global options
knitr::opts_chunk$set(echo=FALSE, warning=FALSE, error=FALSE, message=FALSE, fig.width=10)

lst_qcMetrics_ord = PTXQC:::getMetricsObjects()

txt_TOC = "# Table of Contents
  - [Overview](#Overview)
  - [Metrics](#Metrics)
"
txt_BODY = ""
for (qcm in lst_qcMetrics_ord)
{
  newname = gsub("(.*)\\(.*" , "\\1", gsub("[\\*~%]" , " ", gsub("[\\^\">]" , "", qcm$qcName))) 
  ## remove weird symbols (to serve as link)
  newname_lnk = gsub("[^a-zA-Z0-9]", "", newname)
  txt_TOC = paste0(txt_TOC, paste0("    - [", newname, "](#", newname_lnk, ")\n"))
  txt_BODY = paste0(txt_BODY, '\n
## ', newname, ' <a name="', newname_lnk, '"/>
\n
  <div class="helpText">', qcm$helpTextTemplate, '</div>
<p style="text-align: right"><a href="#TOP">-- back to top --</a></p>\n\n')
}

## print the TOC
cat(txt_TOC)


## ----metrics, echo=FALSE, results="asis"---------------------------------
  cat(txt_BODY)

